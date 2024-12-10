import '../mnemonic_type.dart';

class LegacyMnemonicType implements MnemonicType {
  @override
  String get name => 'Legacy';

  @override
  int get wordCount => 25;
}