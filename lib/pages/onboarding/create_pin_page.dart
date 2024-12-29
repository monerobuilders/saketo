import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreatePinPage extends StatefulWidget {
  final Map<String, Object> extra;

  const CreatePinPage({super.key, required this.extra});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  List<int> pin = [-1, -1, -1, -1];

  List<int> _addPin(int number) {
    for (var i = 0; i < pin.length; i++) {
      if (pin[i] == -1) {
        pin[i] = number;
        break;
      }
    }
    return pin;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                widget.extra['isPINConfirmation'] = false;
                context.pop();
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).primaryColor,
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
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
                                            color: widget.extra[
                                                        'isPINConfirmation'] ==
                                                    true
                                                ? Theme.of(context)
                                                    .colorScheme
                                                    .tertiary
                                                : Theme.of(context)
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
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            widget.extra['isPINConfirmation'] == true
                                ? AppLocalizations.of(context)!.confirmYourPin
                                : AppLocalizations.of(context)!.createAPin,
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.extra['isPINConfirmation'] == true
                                ? AppLocalizations.of(context)!.insertPinAgain
                                : AppLocalizations.of(context)!.insertPin,
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                    color: pin[0] == -1
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                    color: pin[1] == -1
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                    color: pin[2] == -1
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                    shape: BoxShape.circle),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Container(
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                    color: pin[3] == -1
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .tertiary,
                                    shape: BoxShape.circle),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(1);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(2);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(3);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '3',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(4);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '4',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(5);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(6);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '6',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(7);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '7',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(8);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '8',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(9);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '9',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 64,
                                    height: 64,
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pin = _addPin(0);
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: Text(
                                          '0',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .tertiary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 24,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        List<int> newPin = pin;
                                        for (int i = newPin.length - 1;
                                            i >= 0;
                                            i--) {
                                          if (newPin[i] != -1) {
                                            newPin[i] = -1;
                                            break;
                                          }
                                        }
                                        setState(() {
                                          pin = newPin;
                                        });
                                      });
                                    },
                                    child: Container(
                                      width: 64,
                                      height: 64,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .scrim,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          'app_assets/delete.svg',
                                          colorFilter: ColorFilter.mode(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .surface,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
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
                              widget.extra['isPINConfirmation'] = false;
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
                                    if (widget.extra['isPINConfirmation'] ==
                                        true) {
                                      if (pin.contains(-1)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration: const Duration(seconds: 2),
                                                content: Text(
                                                    AppLocalizations.of(context)!
                                                        .fillAllPin)));
                                      } else {
                                        if (widget.extra['pin'] == pin.join()) {
                                          if (widget.extra['isCreateWallet'] == true) {
                                            context.push('/mnemonicDisplayPage',
                                                extra: widget.extra);
                                          } else {
                                            context.push('/mnemonicInputPage',
                                                extra: widget.extra);
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  duration:
                                                      const Duration(seconds: 2),
                                                  content: Text(
                                                      AppLocalizations.of(context)!
                                                          .pinDontMatch)));
                                        }
                                      }
                                    } else {
                                      if (pin.contains(-1)) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                duration: const Duration(seconds: 2),
                                                content: Text(
                                                    AppLocalizations.of(context)!
                                                        .fillAllPin)));
                                      } else {
                                        widget.extra.addAll({
                                          'pin': pin.join(),
                                          'isPINConfirmation': true,
                                        });
                                        context.push("/createPinPage",
                                            extra: widget.extra);
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      minimumSize:
                                          const Size(double.infinity, 48),
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5))),
                                  child: Text(
                                      AppLocalizations.of(context)!.next,
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
            )));
  }
}
