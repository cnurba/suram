import 'package:flutter/material.dart';
import 'package:suram/app/orders/orders_list/presentation/new_orders_page.dart';
import 'package:suram/app/root/application/bottom_nav_bar_provider.dart';
import 'package:suram/app/settings/settings_page.dart';
import 'package:suram/global/theme/theme.dart';

import '../../../app/archived_orders/archivied_orders_page.dart';
import '../../../global/global.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final indexProvider = ref.watch(bottomNavBarProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexProvider,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_zip_outlined),
            label: 'Archive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          ref.read(bottomNavBarProvider.notifier).update((state) => index);
        },
      ),
      body: BottomNavBar(
        index: indexProvider,
        builder: (context, index) {
          switch (index) {
            case 0:
              return const NewOrdersPage();
            case 1:
              return const ArchivedOrdersPage();
            case 2:
              return const SettingsPage();
            default:
              return const NewOrdersPage();
          }
        },
      ),
    );
  }
}

/// BottomNavBarBuilder is a function that takes a [BuildContext] and an [int] index
/// and returns a [Widget]. This is used to build the bottom navigation bar.
/// The [int] index is the current index of the bottom navigation bar.
/// The [BuildContext] is the current context of the app.
/// The [Widget] is the widget that will be displayed based on the index.
typedef BottomNavBarBuilder = Widget Function(BuildContext context, int index);

/// BottomNavBar is a widget that takes a [BottomNavBarBuilder] and an [int] index.
/// This widget is used to build the bottom navigation bar.
/// The [BottomNavBarBuilder] is a function that takes a [BuildContext] and an [int] index
/// and returns a [Widget]. This is used to build the bottom navigation bar.
class BottomNavBar extends StatelessWidget {
  final BottomNavBarBuilder builder;
  final int index;

  const BottomNavBar({super.key, required this.builder, required this.index});

  @override
  Widget build(BuildContext context) {
    return builder(context, index);
  }
}
