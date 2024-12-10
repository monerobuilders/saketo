import 'package:saketo/wallet/wallet_modes/advanced/advanced_mode.dart';
import 'package:saketo/wallet/wallet_modes/basic/basic_mode.dart';
import 'package:saketo/wallet/wallet_modes/hardware/hardware_mode.dart';
import 'package:saketo/wallet/wallet_modes/lightweight/lightweight_mode.dart';
import 'package:saketo/wallet/wallet_modes/paranoia/paranoia_mode.dart';

abstract class WalletMode {
  String get name;
  String get icon;

  factory WalletMode.basic() => BasicMode();
  factory WalletMode.lightweight() => LightweightMode();
  factory WalletMode.advanced() => AdvancedMode();
  factory WalletMode.paranoia() => ParanoiaMode();
  factory WalletMode.hardware() => HardwareMode();
}