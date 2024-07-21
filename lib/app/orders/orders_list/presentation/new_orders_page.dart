import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/presentation/new_order_screen.dart';
import 'package:suram/app/orders/new_orders/presentation/widgets/order_tile.dart';
import 'package:suram/app/orders/order_mix/presentation/new_order_mix_screen.dart';
import 'package:suram/app/orders/orders_list/application/orders_provider.dart';


class NewOrdersPage extends ConsumerWidget {
  const NewOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orderData = ref.watch(orderListProvider);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            mini: true,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewOrderMixScreen(),
                ),
              );
            },
            child: const Icon(Icons.add,size: 20),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewOrderScreen(),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      appBar: AppBar(title: const Text('Список заявок')),
      body: orderData.when(
        data: (orders) => ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            return const OrderTile();
          },
        ),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
