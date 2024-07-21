
import 'package:flutter/material.dart';
import 'package:suram/app/orders/new_orders/application/new_order_item/new_order_item_controller.dart';
import 'package:suram/auth/login/application/provider.dart';

final products = <String>[
  'Product 1',
  'Product 2',
  'Product 3',
  'Product 4',
  'Product 5',
  'Product 6',
  'Product 7',
  'Product 8',
  'Product 9',
  'Product 10',
];

class SelectProductScreen extends ConsumerWidget {
  const SelectProductScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Product Screen')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Product $index'),
            onTap: () {
              ref.read(newOrderItemNotifierProvider.notifier).updateProductName (products[index]);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
