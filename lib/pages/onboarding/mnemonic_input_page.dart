import 'package:flutter/material.dart';

class MnemonicInputPage extends StatefulWidget {
  final Map<String, Object> extra;

  const MnemonicInputPage({super.key, required this.extra});

  @override
  State<MnemonicInputPage> createState() => _MnemonicInputPageState();
}

class _MnemonicInputPageState extends State<MnemonicInputPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Container(
            padding: const EdgeInsets.all(32),
          ),
        ));
  }
}