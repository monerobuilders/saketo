import '../mnemonic_type.dart';

class MyMoneroMnemonicType implements MnemonicType {
  @override
  String get name => 'MyMonero';

  @override
  int get wordCount => 13;
}