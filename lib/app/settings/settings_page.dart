import 'package:flutter/material.dart';
import 'package:suram/global/theme/theme.dart';
import '../../../global/global.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('HomePage'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => ref.read(themeProvider).toggleTheme(),
              icon: Icon(Theme.of(context).customOption.themeIcon),
              label: Text(theme.isDarkMode ? 'DarkMode' : 'LightMode'),
            ),
          ],
        ),
      ),
    );
  }
}
