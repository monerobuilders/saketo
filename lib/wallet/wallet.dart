import 'package:objectbox/objectbox.dart';

import '../db/secure/secure_db.dart';
import '../main.dart';

@Entity()
class Wallet {
  int? id;

  String internalId;
  String name;
  String modeName;

  Wallet({required this.internalId, required this.name, required this.modeName});

  Future<bool> saveMnemonic(String mnemonic, String password) async {
    return await SecureDB.putValue("${internalId}_mnemonic", mnemonic, password);
  }

  Future<String?> getMnemonic(String password) async {
    return await SecureDB.getValue("${internalId}_mnemonic", password);
  }
}