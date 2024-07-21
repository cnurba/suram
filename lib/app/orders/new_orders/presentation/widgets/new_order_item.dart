import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/new_order_item/new_order_item_controller.dart';
import 'package:suram/app/orders/new_orders/application/order/order_controller.dart';
import 'package:suram/app/orders/product/presentation/select_product_screen.dart';
import 'package:suram/global/presentation/widget/suram_editing_field.dart';
import 'package:suram/global/presentation/widget/suram_elevated_button.dart';

class NewOrderItem extends ConsumerWidget {
  const NewOrderItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Orders Page')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SuramEditingField(
            readOnly: false,
            title: "Номенклатура",
            initialText: '',
            updatedText: ref.watch(newOrderItemNotifierProvider).productName,
            onChanged: (p0) {
              ref
                  .read(newOrderItemNotifierProvider.notifier)
                  .updateProductName(p0);
            },
            onSelect: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SelectProductScreen();
              }));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SuramEditingField(
                keyboardType: TextInputType.number,
                halfWidthField: true,
                readOnly: true,
                title: "Количество",
                initialText: "",
                onChanged: (p0) {},
                onSelect: () {},
              ),
              SuramEditingField(
                halfWidthField: true,
                readOnly: true,
                title: "ЕИ",
                initialText: "шт",
                onChanged: (p0) {},
                onSelect: () {},
              ),
            ],
          ),
          SuramEditingField(
            readOnly: true,
            isThreeLine: true,
            title: "Комментарий",
            initialText: "",
            onChanged: (p0) {},
            onSelect: () {},
          ),
          const SizedBox(height: 32),
          SuramElevatedButton(
            text: "Сохранить",
            onPressed: () {
              ref.read(orderNotifierProvider.notifier).addOrderItem(
                  ref.watch(newOrderItemNotifierProvider).representation);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
