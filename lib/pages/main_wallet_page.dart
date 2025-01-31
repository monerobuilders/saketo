import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../main.dart';
import '../wallet/wallet.dart';

class MainWalletPage extends StatefulWidget {
  const MainWalletPage({super.key});

  @override
  State<MainWalletPage> createState() => _MainWalletPageState();
}

class _MainWalletPageState extends State<MainWalletPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 96),
        child: Center(
          child: Text("What's up?", style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 24,
          ),),
        ),
      ),
    ));
  }

  Future<void> testFn() async {
    final store = objectbox.store;
    final box = store.box<Wallet>();
    final wallets = box.getAll();
    for (final wallet in wallets) {
      print("Wallet: ${wallet.name}, ${wallet.modeName}, ${wallet.internalId}");
    }
  }
  @override
  void initState() {
    super.initState();
    testFn();
  }
}