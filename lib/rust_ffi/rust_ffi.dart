import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:saketo/wallet/mnemonics/types/legacy/legacy_mnemonic_type.dart';
import 'package:saketo/wallet/mnemonics/types/polyseed/polyseed_mnemonic_type.dart';

import '../wallet/mnemonics/types/mnemonic_type.dart';

/*

#[repr(C)]
pub struct ResultWithMessage {
    success: bool,
    message: *const c_char,
}


#[no_mangle]
extern "C" fn is_valid_polyseed_mnemonic(mnemonic: *const c_char, language_code: *const c_char) -> ResultWithMessage {
    let c_str = unsafe {
        assert!(!language_code.is_null());
        CStr::from_ptr(language_code)
    };
    let language_str = c_str.to_str().unwrap_or("");
    let language = match language_str {
        "en" => polyseed::Language::English,
        "es" => polyseed::Language::Spanish,
        "fr" => polyseed::Language::French,
        "it" => polyseed::Language::Italian,
        "ja" => polyseed::Language::Japanese,
        "ko" => polyseed::Language::Korean,
        "cs" => polyseed::Language::Czech,
        "pt" => polyseed::Language::Portuguese,
        "zh-CN" => polyseed::Language::ChineseSimplified,
        "zh-TW" => polyseed::Language::ChineseTraditional,
        _ => polyseed::Language::English,
    };
    let mnemonic_str = unsafe {
        assert!(!mnemonic.is_null());
        CStr::from_ptr(mnemonic)
    }
    .to_str()
    .unwrap_or("");
    let seed = polyseed::Polyseed::from_string(language, zeroize::Zeroizing::new(mnemonic_str.to_string()));
    let message = if seed.is_ok() {
        ""
    } else {
        match seed.clone().err().unwrap() {
            // TODO: Make this error messages local.
            polyseed::PolyseedError::InvalidSeed => "Invalid seed. Please check your mnemonic.",
            polyseed::PolyseedError::InvalidEntropy => "Invalid entropy. Please check your mnemonic.",
            polyseed::PolyseedError::InvalidChecksum => "Invalid checksum. Please check your mnemonic.",
            polyseed::PolyseedError::UnsupportedFeatures => "Unsupported features. Please check your mnemonic.",
        }
    };
    ResultWithMessage::new(seed.is_ok(), message)
}

 */

final DynamicLibrary rustLib = Platform.isAndroid
    ? DynamicLibrary.open("libsaketo_rust.so")
    : (Platform.isIOS
        ? DynamicLibrary.process()
        : DynamicLibrary.open("libsaketo_rust.dylib"));

final Pointer<Utf8> Function() generatePolyseedMnemonic = rustLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>(
        "generate_polyseed_mnemonic")
    .asFunction();

final Pointer<Utf8> Function() generateLegacyMnemonic = rustLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>(
        "generate_legacy_mnemonic")
    .asFunction();

final class ResultWithMessage extends Struct {
  @Bool()
  external bool success;

  external Pointer<Utf8> message;
}

final ResultWithMessage Function(Pointer<Utf8>, Pointer<Utf8>)
    isValidPolyseedMnemonic = rustLib
        .lookup<
            NativeFunction<
                ResultWithMessage Function(Pointer<Utf8>,
                    Pointer<Utf8>)>>("is_valid_polyseed_mnemonic")
        .asFunction();

final ResultWithMessage Function(Pointer<Utf8>, Pointer<Utf8>)
    isValidLegacyMnemonic = rustLib
        .lookup<
            NativeFunction<
                ResultWithMessage Function(Pointer<Utf8>,
                    Pointer<Utf8>)>>("is_valid_legacy_mnemonic")
        .asFunction();

final void Function(Pointer<Utf8>) freeCString = rustLib
    .lookup<NativeFunction<Void Function(Pointer<Utf8>)>>("free_c_string")
    .asFunction();

final void Function(Pointer<Bool>) freeBool = rustLib
    .lookup<NativeFunction<Void Function(Pointer<Bool>)>>('free_bool')
    .asFunction();

String generateSeedString(MnemonicType mnemonicType) {
  late final Pointer<Utf8> seedPointer;
  switch (mnemonicType) {
    case PolyseedMnemonicType():
      seedPointer = generatePolyseedMnemonic();
    case LegacyMnemonicType():
      seedPointer = generateLegacyMnemonic();
    default:
      seedPointer = generatePolyseedMnemonic();
  }
  final String seed = seedPointer.toDartString();
  freeCString(seedPointer);
  return seed;
}

(bool, String) checkIsValidMnemonic(
    MnemonicType mnemonicType, String mnemonic, String languageCode) {
  final Pointer<Utf8> mnemonicPointer = mnemonic.toNativeUtf8();
  final Pointer<Utf8> languageCodePointer = languageCode.toNativeUtf8();
  late final ResultWithMessage result;
  switch (mnemonicType) {
    case PolyseedMnemonicType():
      result = isValidPolyseedMnemonic(mnemonicPointer, languageCodePointer);
    case LegacyMnemonicType():
      result = isValidLegacyMnemonic(mnemonicPointer, languageCodePointer);
    default:
      result = isValidPolyseedMnemonic(mnemonicPointer, languageCodePointer);
  }
  freeCString(mnemonicPointer);
  freeCString(languageCodePointer);
  final bool success = result.success;
  final String message = result.message.toDartString();
  freeCString(result.message);
  return (success, message);
}
