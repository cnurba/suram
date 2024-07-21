
import 'package:flutter/material.dart';

class ArchivedOrdersPage extends StatelessWidget {
  const ArchivedOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Archived Orders Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text('Archived Orders Page'),
          ],
        ),
      ),
    );
  }
}
