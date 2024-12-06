import 'package:go_router/go_router.dart';
import 'package:saketo/pages/onboarding/entrypoint.dart';
import 'package:saketo/pages/onboarding/mode_selection_page.dart';
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
      builder: (context, state) => const ModeSelectionPage()),
]);
