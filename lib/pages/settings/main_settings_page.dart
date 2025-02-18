import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:saketo/main.dart';
import 'package:saketo/pages/entrypoint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../wallet/wallet.dart';

class MainSettingsPage extends StatelessWidget {
  final Wallet theWallet;

  const MainSettingsPage({super.key, required this.theWallet});

  static const routeName = '/mainSettingsPage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                objectbox.store.box<Wallet>().remove(theWallet.id!);
                final sharedPrefs = await SharedPreferences.getInstance();
                sharedPrefs.setBool("is_initialized", false);
                if (context.mounted) context.push(Entrypoint.routeName);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(5)),
                child: Text(
                  AppLocalizations.of(context)!.deleteThisWallet,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
