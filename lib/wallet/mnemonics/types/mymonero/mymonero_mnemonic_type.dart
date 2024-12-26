import '../mnemonic_type.dart';

class MyMoneroMnemonicType implements MnemonicType {
  @override
  String get name => 'MyMonero';

  @override
  int get wordCount => 13;

  // TODO: Implement this method when the MyMonero mnemonic generation is implemented
  @override
  List<String> generateMnemonic() => throw UnimplementedError();
}