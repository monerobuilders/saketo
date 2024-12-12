import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:saketo/wallet/mnemonics/types/mnemonic_type.dart';

class MnemonicDisplayPage extends StatelessWidget {
  final Map<String, Object> extra;

  const MnemonicDisplayPage({super.key, required this.extra});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    MnemonicType chosenMnemonic = extra['mnemonicType'] as MnemonicType;
    int wordCount = chosenMnemonic.wordCount;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
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
                                      color: Theme.of(context).colorScheme.tertiary,
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
                                            .tertiary,
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
                                            .tertiary,
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
                                            .tertiary,
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
                                            .tertiary,
                                        borderRadius:
                                        BorderRadius.circular(32)))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        AppLocalizations.of(context)!.mnemonicReview,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.tertiary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.writeItDown,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        AppLocalizations.of(context)!.mnemonicDisplayExplanation,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(child: Column(
                  children: [
                    for (int i = index; i < wordCount; i = i + 2)
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      '${i + 1}.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).colorScheme.tertiary,
                                      ),
                                    ),
                                  )),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: (((wordCount % 2 != 0) && (i + 1 != wordCount)) || (wordCount % 2 == 0))
                                        ? BoxDecoration(
                                        color: Theme.of(context).colorScheme.secondary,
                                        borderRadius: BorderRadius.circular(5))
                                        : const BoxDecoration(),
                                    child: (((wordCount % 2 != 0) && (i + 1 != wordCount)) || (wordCount % 2 == 0))
                                        ? Text(
                                      "${i+2}.",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).colorScheme.tertiary,
                                      ),
                                    )
                                        : null,
                                  )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                  ],
                )),
                const SizedBox(
                  height: 16,
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
                            'app_assets/arrow_left.svg',
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
                              onPressed: () {
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(double.infinity, 48),
                                  foregroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                                  backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Text(AppLocalizations.of(context)!.next,
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
              ],
            ),
          ),
        ));
  }
}