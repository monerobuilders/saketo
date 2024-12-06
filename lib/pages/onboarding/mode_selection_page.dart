import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../wallet/wallet_mode_enum.dart';

class ModeSelectionPage extends StatefulWidget {
  const ModeSelectionPage({super.key});

  @override
  State<ModeSelectionPage> createState() => _ModeSelectionPageState();
}

class _ModeSelectionPageState extends State<ModeSelectionPage> {
  WalletMode _selectedMode = WalletMode.basic;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: Column(children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 6,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(32)),
                              )),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(32)))),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(32)))),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(32)))),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                  child: Container(
                                      height: 6,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          borderRadius:
                                              BorderRadius.circular(32)))),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'CHOOSE WALLET MODE',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.tertiary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedMode = WalletMode.basic;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: _selectedMode == WalletMode.basic
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.scrim,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: _selectedMode ==
                                                    WalletMode.basic
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .scrim
                                                : const Color(0xFF3F3F3F),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        width: 40,
                                        child: SvgPicture.asset(
                                          'app_assets/box.svg',
                                          colorFilter: ColorFilter.mode(
                                              _selectedMode == WalletMode.basic
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .tertiary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Basic",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "Default.\nAutomates almost everything.",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 24,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: _selectedMode ==
                                                      WalletMode.basic
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .scrim,
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Visibility(
                                                  visible: _selectedMode ==
                                                      WalletMode.basic,
                                                  child: Container(
                                                    width: 14,
                                                    height: 14,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                          const SizedBox(width: 16),
                          Expanded(
                              child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedMode = WalletMode.advanced;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: _selectedMode == WalletMode.advanced
                                      ? Theme.of(context).colorScheme.secondary
                                      : Theme.of(context).colorScheme.scrim,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: _selectedMode ==
                                                    WalletMode.advanced
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .scrim
                                                : const Color(0xFF3F3F3F),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        padding: const EdgeInsets.all(6),
                                        height: 40,
                                        width: 40,
                                        child: SvgPicture.asset(
                                          'app_assets/adv_box.svg',
                                          colorFilter: ColorFilter.mode(
                                              _selectedMode ==
                                                      WalletMode.advanced
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .tertiary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .surface,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Advanced",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          fontSize: 14,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    "For experienced users to access more configuration options.",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.surface,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                      width: double.infinity,
                                      height: 24,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              color: _selectedMode ==
                                                      WalletMode.advanced
                                                  ? Theme.of(context)
                                                      .colorScheme
                                                      .secondary
                                                  : Theme.of(context)
                                                      .colorScheme
                                                      .scrim,
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .tertiary,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                              child: Visibility(
                                                  visible: _selectedMode ==
                                                      WalletMode.advanced,
                                                  child: Container(
                                                    width: 14,
                                                    height: 14,
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                      shape: BoxShape.circle,
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = WalletMode.paranoia;
                          });
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: _selectedMode == WalletMode.paranoia
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context).colorScheme.scrim,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Container(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: _selectedMode ==
                                                  WalletMode.paranoia
                                                  ? Theme.of(context)
                                                  .colorScheme
                                                  .scrim
                                                  : const Color(0xFF3F3F3F),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                            'app_assets/eye_off.svg',
                                            colorFilter: ColorFilter.mode(
                                                _selectedMode ==
                                                    WalletMode.paranoia
                                                    ? Theme.of(context)
                                                    .colorScheme
                                                    .tertiary
                                                    : Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Paranoia",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Ideal for users seeking maximum privacy with strict security measures.",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: _selectedMode ==
                                      WalletMode.paranoia
                                      ? Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      : Theme.of(context)
                                      .colorScheme
                                      .scrim,
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary,
                                    width: 1,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Visibility(
                                      visible: _selectedMode ==
                                          WalletMode.paranoia,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          shape: BoxShape.circle,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Handle when lightweight mode is implemented
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: const Color(0xFF4A4A4A),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Container(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF555555),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                            'app_assets/cloud.svg',
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color (0xFF555555),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          height: 40,
                                          width: 60,
                                          child: Center(
                                            child: Text(
                                              "Soon",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Lightweight",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Connects to a remote server to scan for transactions efficiently.",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A4A4A),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary,
                                    width: 1,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Visibility(
                                      visible: false,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          shape: BoxShape.circle,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Handle when hardware mode is implemented
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: const Color(0xFF4A4A4A),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Container(
                                padding: const EdgeInsets.all(6),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF555555),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          padding: const EdgeInsets.all(10),
                                          height: 40,
                                          width: 40,
                                          child: SvgPicture.asset(
                                            'app_assets/shield.svg',
                                            colorFilter: ColorFilter.mode(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: const Color (0xFF555555),
                                              borderRadius:
                                              BorderRadius.circular(5)),
                                          height: 40,
                                          width: 60,
                                          child: Center(
                                            child: Text(
                                              "Soon",
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          "Hardware",
                                          style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      "Securing your funds by storing your private keys in a seperate secure device.",
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A4A4A),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary,
                                    width: 1,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(30),
                                ),
                                child: Center(
                                  child: Visibility(
                                      visible: false,
                                      child: Container(
                                        width: 14,
                                        height: 14,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                          shape: BoxShape.circle,
                                        ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SizedBox(
                            height: 48,
                            width: 48,
                            child: SvgPicture.asset(
                              'app_assets/chevron_left.svg',
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.surface,
                                  BlendMode.srcIn),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 48),
                                    foregroundColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                child: Text('NEXT',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                        fontSize: 16)))),
                        const SizedBox(
                          width: 16,
                        ),
                        const SizedBox(
                          width: 48,
                        )
                      ],
                    ),
                  ),
                ]))));
  }
}
