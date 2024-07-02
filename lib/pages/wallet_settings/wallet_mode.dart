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
                  height: 10
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Text(
                    Locals.of(context)!.chooseWalletMode,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Oxanium',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30
                ),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 5, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 10, bottom: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          )
                      ),
                    ],
                  )
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child:  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child:  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child:  Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavigationButton(
            onPressed: () {
            },
            text: Locals.of(context)!.continueStr,
          ),
        ],
      ),
    );
  }
}