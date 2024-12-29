import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../wallet/mnemonics/types/mnemonic_type.dart';

class MnemonicInputPage extends StatefulWidget {
  final Map<String, Object> extra;

  const MnemonicInputPage({super.key, required this.extra});

  @override
  State<MnemonicInputPage> createState() => _MnemonicInputPageState();
}

class _MnemonicInputPageState extends State<MnemonicInputPage> {
  late List<String> mnemonicWords;
  late int wordCount;

  @override
  void initState() {
    super.initState();
    MnemonicType chosenMnemonicType = widget.extra['mnemonicType'] as MnemonicType;
    wordCount = chosenMnemonicType.wordCount;
    mnemonicWords = List.filled(wordCount, '');
  }

  @override
  Widget build(BuildContext context) {
    int index = 0;
    print("Words: ${mnemonicWords.join(' ')}");
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
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(32)))),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(32)))),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(32)))),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                    borderRadius: BorderRadius.circular(32)))),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    AppLocalizations.of(context)!.mnemonicConfiguration,
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
                    AppLocalizations.of(context)!.mnemonicInputExplanation,
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = index; i < wordCount; i = i + 2)
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText: "${i + 1}.",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    enabled: false,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                    child: TextField(
                                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                      onChanged: (value) {
                                        setState(() {
                                          mnemonicWords[i] = value;
                                        });
                                      },
                                      cursorColor: Theme.of(context).colorScheme.tertiary,
                                      maxLength: 12,
                                      buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
                                      decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)!.word,
                                    hintStyle: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .colorScheme.outline,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                ))
                              ],
                            ),
                          )),
                          const SizedBox(
                            width: 8,
                          ),
                          Expanded(
                              child: Container(
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                            decoration: (((wordCount % 2 != 0) &&
                                        (i + 1 != wordCount)) ||
                                    (wordCount % 2 == 0))
                                ? BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(5))
                                : const BoxDecoration(),
                            child: (((wordCount % 2 != 0) &&
                                        (i + 1 != wordCount)) ||
                                    (wordCount % 2 == 0))
                                ? Row(
                              children: [
                                SizedBox(
                                  width: 32,
                                  child: TextField(
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText: "${i + 2}.",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                    enabled: false,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                    child: TextField(
                                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                      onChanged: (value) {
                                        setState(() {
                                          mnemonicWords[i + 1] = value;
                                        });
                                      },
                                      cursorColor: Theme.of(context).colorScheme.tertiary,
                                      maxLength: 12,
                                      buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null,
                                      decoration: InputDecoration(
                                        hintText: AppLocalizations.of(context)!.word,
                                        hintStyle: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .colorScheme.outline,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color:
                                        Theme.of(context).colorScheme.tertiary,
                                      ),
                                    ))
                              ],
                            )
                                : null,
                          )),
                        ],
                      ),
                    ),
                ],
              ),
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
                          onPressed: () {},
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
                                  color: Theme.of(context).colorScheme.tertiary,
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
