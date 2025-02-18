import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:saketo/db/secure/secure_db.dart';
import 'package:saketo/pages/receive/main_recive_page.dart';
import 'package:saketo/pages/settings/main_settings_page.dart';

import '../wallet/wallet.dart';
import '../wallet/wallet_modes/wallet_mode_abstract.dart';

class MainWalletPage extends StatefulWidget {
  final Wallet theWallet;

  const MainWalletPage({super.key, required this.theWallet});

  static const routeName = '/mainWalletPage';

  @override
  State<MainWalletPage> createState() => _MainWalletPageState();
}

class _MainWalletPageState extends State<MainWalletPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      'app_assets/saketo_logo_text_only.svg',
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.tertiary,
                          BlendMode.srcIn),
                      height: 24,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('app_assets/bar_chart.svg',
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.surface,
                                BlendMode.srcIn),
                            height: 24),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            context.push(MainSettingsPage.routeName,
                                extra: widget.theWallet);
                          },
                          child: SvgPicture.asset('app_assets/settings.svg',
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.surface,
                                  BlendMode.srcIn),
                              height: 24),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.scrim,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            WalletMode.fromName(widget.theWallet.modeName).icon,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.tertiary,
                                BlendMode.srcIn),
                            height: 32,
                            width: 32,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text(
                            widget.theWallet.name,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(
                              text: "XMR",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.surface,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(
                              text: ' ',
                            ),
                            TextSpan(
                              text: "0.00000000",
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.tertiary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF468053),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text('Synchronized',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.tertiary,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(5),
                ),
              )),
              const SizedBox(height: 12),
              SizedBox(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondary, // Background color
                            padding: const EdgeInsets.all(
                                12), // Padding inside button
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Border radius
                            ),
                          ),
                          onPressed: () {
                            context.push(MainReceivePage.routeName, extra: widget.theWallet);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.scrim,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: SvgPicture.asset(
                                  'app_assets/arrow_down_circle.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.tertiary,
                                      BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text('Receive',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        )),
                        const SizedBox(width: 6),
                        Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .secondary, // Background color
                                padding: const EdgeInsets.all(
                                    12), // Padding inside button
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5), // Border radius
                                ),
                              ),
                          onPressed: () {  },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.scrim,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                padding: const EdgeInsets.all(6),
                                child: SvgPicture.asset(
                                  'app_assets/send.svg',
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.tertiary,
                                      BlendMode.srcIn),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text('Send',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    fontWeight: FontWeight.bold,
                                  ))
                            ],
                          ),
                        )),
                      ],
                    ),
                  ))
            ],
          )),
    ));
  }
}
