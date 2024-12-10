import '../mnemonic_type.dart';

class PolyseedMnemonicType implements MnemonicType {
  @override
  String get name => 'Polyseed';

  @override
  int get wordCount => 16;
}