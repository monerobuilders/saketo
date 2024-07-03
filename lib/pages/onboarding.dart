import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/locals.dart';
import 'package:saketo_src/widgets/buttons/bottom_navigation_button.dart';

import 'wallet_settings/wallet_mode.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: Text(
                    Locals.of(context)!.welcomeToSaketo,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    Locals.of(context)!.onboardingDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'nunito',
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomNavigationButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const WalletMode(isNew: true)),
                );
              },
              text: Locals.of(context)!.continueStr),
        ]));
  }
}
