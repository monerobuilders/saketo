import 'package:saketo/wallet/wallet_modes/wallet_mode_abstract.dart';

class BusinessMode implements WalletMode {
  @override
  String get name => 'Business';

  @override
  String get icon => 'app_assets/briefcase.svg';
}