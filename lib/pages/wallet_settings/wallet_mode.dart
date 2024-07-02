import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/locals.dart';

import '../../widgets/bottom_navigation_button.dart';

class WalletMode extends StatefulWidget {
  const WalletMode({
    super.key,
    required this.isNew,
    this.walletId,
  });

  final bool isNew;
  final String? walletId;

  @override
  State<WalletMode> createState() => _WalletModeState();
}

class _WalletModeState extends State<WalletMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: Text(
                    widget.isNew ? 'Create new wallet' : 'Import wallet',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'Oxanium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: Text(
                    widget.isNew ? 'Create a new wallet' : 'Import an existing wallet',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Oxanium',
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomNavigationButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            text: Locals.of(context)!.continueStr,
          ),
        ],
      ),
    );
  }
}