import 'package:go_router/go_router.dart';
import 'package:suram/app/root/presentation/home_page.dart';
import 'package:suram/auth/login/presentation/login_page.dart';
import 'package:suram/global/presentation/screens/error_page.dart';

class AppRouter {
  static String get homePage => '/login';
  static String get loginPage => '/home';
  static const String _homePath = '/';

  GoRouter router = GoRouter(
    initialLocation: _homePath,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: homePage,
        path: _homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: loginPage,
        path: _homePath,
        builder: (context, state) => const LoginPage(),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(state.error!),
  );
}
