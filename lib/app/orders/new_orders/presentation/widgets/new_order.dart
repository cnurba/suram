import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/new_order/new_order_controller.dart';
import 'package:suram/app/orders/new_orders/application/order/order_controller.dart';
import 'package:suram/global/presentation/widget/date_picker_text_field.dart';
import 'package:suram/global/presentation/widget/suram_drop_down_button.dart';
import 'package:suram/global/presentation/widget/suram_elevated_button.dart';


class NewOrder extends ConsumerWidget {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Orders Page')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DatePickerTextField(
              title: "Дата",
              onChanged: (value) {
                ref.read(newOrderNotifierProvider.notifier).updateDueDate(value);
              },
            ),
            // SuramDropDownButton(
            //     title: "Заказ",
            //     items: [
            //       DropMenu(id: "1", label: "Заказ 1"),
            //       DropMenu(id: "Заказ 2", label: "Заказ 2"),
            //       DropMenu(id: "Заказ 3", label: "Заказ 3"),
            //     ],
            //     onSelected: (value) {
            //       ref
            //           .read(newOrderNotifierProvider.notifier)
            //           .updateOrderName(value.id);
            //     }),
            const SizedBox(height: 16),
            SuramDropDownButton(
                title: "Вид заявки",
                items: [
                  DropMenu(id: "1", label: "Заявка на приобретение бетона"),
                  DropMenu(id: "2", label: "Заявка на приобретение арматуры"),
                  DropMenu(id: "3", label: "Заявка на приобретение газоблока"),
                  DropMenu(id: "4", label: "Заявка на прочих материалов"),
                ],
                onSelected: (value) {
                  ref
                      .read(newOrderNotifierProvider.notifier)
                      .updateOrderName(value.id);
                }),
            const SizedBox(height: 16),
            SuramDropDownButton(
                items: [
                  DropMenu(id: "Блок 1", label: "Блок 1"),
                  DropMenu(id: "Блок 2", label: "Блок 2"),
                  DropMenu(id: "Блок 3", label: "Блок 3"),
                ],
                title: "Блок",
                onSelected: (value) {
                  ref
                      .read(newOrderNotifierProvider.notifier)
                      .updateBlockName(value.id);
                }),

            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerRight,
              child: SuramElevatedButton(
                text: "Создать заказ",
                onPressed: () {
                  ref
                      .read(orderNotifierProvider.notifier)
                      .addOrder(ref.watch(newOrderNotifierProvider).representation);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
