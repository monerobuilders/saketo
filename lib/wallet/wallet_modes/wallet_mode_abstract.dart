import 'package:saketo/wallet/wallet_modes/advanced/advanced_mode.dart';
import 'package:saketo/wallet/wallet_modes/basic/basic_mode.dart';
import 'package:saketo/wallet/wallet_modes/hardware/hardware_mode.dart';
import 'package:saketo/wallet/wallet_modes/lightweight/lightweight_mode.dart';
import 'package:saketo/wallet/wallet_modes/paranoia/paranoia_mode.dart';

import 'business/business_mode.dart';
import 'multisignature/multisignature_mode.dart';

abstract class WalletMode {
  String get name;
  String get icon;

  factory WalletMode.basic() => BasicMode();
  factory WalletMode.lightweight() => LightweightMode();
  factory WalletMode.advanced() => AdvancedMode();
  factory WalletMode.paranoia() => ParanoiaMode();
  factory WalletMode.hardware() => HardwareMode();
  factory WalletMode.business() => BusinessMode();
  factory WalletMode.multisignature() => MultisignatureMode();

  factory WalletMode.fromName(String name) {
    switch (name) {
      case 'Basic':
        return WalletMode.basic();
      case 'Lightweight':
        return WalletMode.lightweight();
      case 'Advanced':
        return WalletMode.advanced();
      case 'Paranoia':
        return WalletMode.paranoia();
      case 'Hardware':
        return WalletMode.hardware();
      case 'Business':
        return WalletMode.business();
      case 'Multisignature':
        return WalletMode.multisignature();
      default:
        throw Exception('Unknown wallet mode: $name');
    }
  }
}