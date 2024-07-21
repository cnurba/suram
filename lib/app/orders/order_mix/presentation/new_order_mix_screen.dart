import 'package:flutter/material.dart';

class NewOrderMixScreen extends StatelessWidget {
  const NewOrderMixScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Order Mix Page')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CheckboxListTile(
            visualDensity: VisualDensity.compact,
            controlAffinity: ListTileControlAffinity.leading,
            value: false,
            title: Text('Заявка № $index'),
            onChanged: (value) {},
          );
        },
      ),
    );
  }
}
