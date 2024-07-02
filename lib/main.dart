import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/locals.dart';
import 'package:saketo_src/pages/onboarding.dart';

void main() {
  runApp(const Startpoint());
}

class Startpoint extends StatelessWidget {
  const Startpoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        Locals.delegate,
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
      ],
      home: Onboarding(),
    );
  }
}
