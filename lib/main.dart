import 'package:flutter/material.dart';
import 'package:suram/global/provider/provider_logger.dart';
import 'package:suram/global/routes/router_provider.dart';
import 'package:suram/global/theme/theme.dart';
import 'global/global.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const AppRoot(),
    ),
  );
}

class AppRoot extends ConsumerWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final themeMode = ref.watch(themeModeProvider);
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      routerConfig: goRouter,
    );
  }
}
