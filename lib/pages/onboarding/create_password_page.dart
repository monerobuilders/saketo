import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:saketo/pages/onboarding/mnemonic_display_page.dart';
import 'package:saketo/pages/onboarding/mnemonic_input_page.dart';

class CreatePasswordPage extends StatefulWidget {
  final Map<String, Object> extra;

  const CreatePasswordPage({super.key, required this.extra});

  static const routeName = '/createPasswordPage';

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  String password = '';
  String passwordConfirmation = '';
  bool emptyPassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        resizeToAvoidBottomInset: false,
        body: Container(
            padding: const EdgeInsets.all(24),
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
                                            .secondary,
                                        borderRadius:
                                            BorderRadius.circular(32)))),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        AppLocalizations.of(context)!.createAPassword,
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
                  height: 16
                ),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.password,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.scrim,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2,
                              ),
                            ),
                            child: TextField(
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              onChanged: (value) {
                                setState(() {
                                  password = value;
                                  emptyPassword = false;
                                });
                              },
                              cursorColor:
                              Theme.of(context).colorScheme.tertiary,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(12),
                                hintText: AppLocalizations.of(context)!.enterPassword,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.passwordConfirmation,
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.scrim,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.surface,
                                width: 2,
                              ),
                            ),
                            child: TextField(
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              onChanged: (value) {
                                setState(() {
                                  passwordConfirmation = value;
                                  emptyPassword = false;
                                });
                              },
                              cursorColor:
                              Theme.of(context).colorScheme.tertiary,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(12),
                                hintText: AppLocalizations.of(context)!.enterPasswordAgain,
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
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
                                if (password != passwordConfirmation) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        duration: const Duration(seconds: 2),
                                          content: Text(
                                              AppLocalizations.of(context)!
                                                  .passwordsDoNotMatch)));
                                  return;
                                } else {
                                  if (password.isEmpty && !emptyPassword) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            duration: const Duration(seconds: 2),
                                            content: Text(
                                                AppLocalizations.of(context)!
                                                    .passwordEmptyWarning)));
                                    setState(() {
                                      emptyPassword = true;
                                    });
                                  } else {
                                    widget.extra.addAll({
                                      'password': password,
                                    });
                                    if (widget.extra['isCreateWallet'] as bool) {
                                      context.push(MnemonicDisplayPage.routeName,
                                          extra: widget.extra);
                                    } else {
                                      context.push(MnemonicInputPage.routeName,
                                          extra: widget.extra);
                                    }
                                  }
                                }
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
            )),
      ),
    );
  }
}
