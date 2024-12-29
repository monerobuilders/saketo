import 'package:go_router/go_router.dart';
import 'package:saketo/pages/onboarding/create_pin_page.dart';
import 'package:saketo/pages/onboarding/entrypoint.dart';
import 'package:saketo/pages/onboarding/mnemonic_display_page.dart';
import 'package:saketo/pages/onboarding/mnemonic_input_page.dart';
import 'package:saketo/pages/onboarding/mode_selection_page.dart';
import 'package:saketo/pages/onboarding/preview_configuration_page.dart';
import 'package:saketo/pages/onboarding/welcome_page.dart';

final routerConfig = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Entrypoint(),
  ),
  GoRoute(
    path: '/welcomePage',
    builder: (context, state) => const WelcomePage(),
  ),
  GoRoute(
      path: '/modeSelectionPage',
      builder: (context, state) {
        return ModeSelectionPage(extra: state.extra as Map<String, Object>);
      }),
  GoRoute(
    path: '/previewConfigurationPage',
    builder: (context, state) {
      return PreviewConfigurationPage(
          extra: state.extra as Map<String, Object>);
    },
  ),
  GoRoute(
      path: '/createPinPage',
      builder: (context, state) {
        return CreatePinPage(extra: state.extra as Map<String, Object>);
      }),
  GoRoute(
      path: '/mnemonicDisplayPage',
      builder: (context, state) {
        return MnemonicDisplayPage(extra: state.extra as Map<String, Object>);
      }),
  GoRoute(
      path: '/mnemonicInputPage',
      builder: (context, state) {
        return MnemonicInputPage(extra: state.extra as Map<String, Object>);
      }),
]);
