import 'package:saketo/wallet/mnemonics/types/polyseed/polyseed_mnemonic_type.dart';

import 'legacy/legacy_mnemonic_type.dart';
import 'mymonero/mymonero_mnemonic_type.dart';

abstract class MnemonicType {
  String get name;
  int get wordCount;
  List<String> generateMnemonic();

  factory MnemonicType.polyseed() => PolyseedMnemonicType();
  factory MnemonicType.legacy() => LegacyMnemonicType();
  factory MnemonicType.mymonero() => MyMoneroMnemonicType();
}