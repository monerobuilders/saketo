import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/locals.dart';

import '../../widgets/buttons/bottom_navigation_button.dart';

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
  WalletModeType selectedType = WalletModeType.basic;

  // TODO: Add localization for this function
  String getEnumPrettyName(WalletModeType type) {
    switch (type) {
      case WalletModeType.basic:
        return 'basic';
      case WalletModeType.advanced:
        return 'advanced';
      case WalletModeType.business:
        return 'business';
      case WalletModeType.paranoia:
        return 'paranoia';
      case WalletModeType.lightweight:
        return 'lightweight';
    }
  }

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
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    Locals.of(context)!.chooseWalletMode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    Locals.of(context)!.chooseWalletModeDescription,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'nunito',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedType = WalletModeType.basic;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: selectedType == WalletModeType.basic
                                          ? [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                              ),
                                            ]
                                          : null,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(FluentIcons.emoji_32_regular, size: 50),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('Basic',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'nunito',
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            child: Text('Simple wallet with basic features. Recommended for most users.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                )))
                                      ],
                                    ),
                                  ),
                                ))),
                        Expanded(
                            child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 20, bottom: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedType = WalletModeType.advanced;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: selectedType == WalletModeType.advanced
                                          ? [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                              ),
                                            ]
                                          : null,
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(FluentIcons.emoji_meme_24_regular, size: 50),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('Advanced',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'nunito',
                                              fontWeight: FontWeight.w700,
                                            )),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            child: Text('Wallet with advanced features. Recommended for experienced users.',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                )))
                                      ],
                                    ),
                                  ),
                                ))),
                      ],
                    )),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                                child: const Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 20, right: 10),
                                        child: Icon(FluentIcons.building_32_regular, size: 40),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Business',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text('Soon',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontFamily: 'architects-daughter',
                                        fontWeight: FontWeight.w700,
                                      )),
                                ))
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                              child: const Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 10),
                                      child: Icon(FluentIcons.eye_off_24_regular, size: 40),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Paranoia',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'nunito',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text('Soon',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'architects-daughter',
                                      fontWeight: FontWeight.w700,
                                    )),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ImageFiltered(
                              imageFilter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                              child: const Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 10),
                                      child: Icon(FluentIcons.teddy_24_regular, size: 40),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    'Lightweight',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'nunito',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 30),
                                child: Text('Soon',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'architects-daughter',
                                      fontWeight: FontWeight.w700,
                                    )),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationButton(
            onPressed: () {},
            text: Locals.of(context)!.continueWithX(getEnumPrettyName(selectedType)),
          ),
        ],
      ),
    );
  }
}

enum WalletModeType { basic, advanced, business, paranoia, lightweight }
