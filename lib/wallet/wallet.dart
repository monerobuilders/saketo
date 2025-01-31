import 'package:objectbox/objectbox.dart';
import 'package:saketo/wallet/wallet_modes/wallet_mode_abstract.dart';

@Entity()
class Wallet {
  int? id;

  String internalId;
  String name;
  String modeName;

  Wallet({required this.internalId, required this.name, required this.modeName});
}