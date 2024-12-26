import '../../../../rust_ffi/rust_ffi.dart';
import '../mnemonic_type.dart';

class LegacyMnemonicType implements MnemonicType {
  @override
  String get name => 'Legacy';

  @override
  int get wordCount => 25;

  @override
  List<String> generateMnemonic() => generateSeedString(MnemonicType.legacy()).split(' ');
}