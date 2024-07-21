import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/order/order_controller.dart';
import 'package:suram/app/orders/new_orders/presentation/widgets/new_order.dart';
import 'package:suram/app/orders/new_orders/presentation/widgets/new_order_item.dart';
import 'package:suram/global/presentation/widget/animated_switch_button.dart';
import 'package:suram/global/presentation/widget/hyper_link_button.dart';
import 'package:suram/global/presentation/widget/suram_elevated_button.dart';


class NewOrderScreen extends ConsumerWidget {
  const NewOrderScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasOrder = ref.watch(orderNotifierProvider).orderName.isNotEmpty;
    return Scaffold(
      appBar: AppBar(title: const Text('New Orders Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Column(
          // padding: const EdgeInsets.symmetric(horizontal: 16),
          // physics: const BouncingScrollPhysics(),
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HyperLinkButton(
              title: ref.watch(orderNotifierProvider).orderName,
              isBig: true,
              onPressed: () {},
            ),
            Expanded(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: ref.watch(orderNotifierProvider).items.length,
                    itemBuilder: (context, index) {
                      return HyperLinkButton(
                        title: ref.watch(orderNotifierProvider).items[index],
                        onPressed: () {},
                        isBig: false,
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedSwitchButton(
                        isOrder: hasOrder,
                        onAddOrder: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NewOrder();
                          }));
                        },
                        onAddProduct: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NewOrderItem();
                          }));
                        }),
                  ),
                ],
              ),
            ),
            Center(
              child: SuramElevatedButton(
                text: "Оформить заказ",
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
