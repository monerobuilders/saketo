import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:saketo/wallet/mnemonics/types/legacy/legacy_mnemonic_type.dart';
import 'package:saketo/wallet/mnemonics/types/polyseed/polyseed_mnemonic_type.dart';

import '../wallet/mnemonics/types/mnemonic_type.dart';

final DynamicLibrary rustLib = Platform.isAndroid
    ? DynamicLibrary.open("libsaketo_rust.so")
    : (Platform.isIOS
        ? DynamicLibrary.process()
        : DynamicLibrary.open("libsaketo_rust.dylib"));

final Pointer<Utf8> Function() generatePolyseedMnemonic = rustLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>("generate_polyseed_mnemonic")
    .asFunction();

final Pointer<Utf8> Function() generateLegacyMnemonic = rustLib
    .lookup<NativeFunction<Pointer<Utf8> Function()>>("generate_legacy_mnemonic")
    .asFunction();

final void Function(Pointer<Utf8>) freeCString = rustLib
    .lookup<NativeFunction<Void Function(Pointer<Utf8>)>>("free_c_string")
    .asFunction();

String generateSeedString(MnemonicType mnemonicType) {
  switch (mnemonicType) {
    case PolyseedMnemonicType():
      final Pointer<Utf8> seedPointer = generatePolyseedMnemonic();
      final String seed = seedPointer.toDartString();
      freeCString(seedPointer);
      return seed;
    case LegacyMnemonicType():
      final Pointer<Utf8> seedPointer = generateLegacyMnemonic();
      final String seed = seedPointer.toDartString();
      freeCString(seedPointer);
      return seed;
    default:
      return generatePolyseedMnemonic().toDartString();
  }
}
