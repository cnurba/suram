

import 'package:flutter/material.dart';

class AnimatedSwitchButton extends StatelessWidget {
  const AnimatedSwitchButton({super.key, required this.isOrder, this.onAddOrder, this.onAddProduct});
  final bool isOrder;

  final Function()? onAddOrder;
  final Function()? onAddProduct;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),

      firstChild: TextButton.icon(
        icon: const Icon(Icons.add),
        onPressed: onAddOrder,
        label: const Text("Новый заказ"),
      ),
      secondChild: TextButton.icon(
        icon: const Icon(Icons.add),
        onPressed: onAddProduct,
        label: const Text("Новый продукт"),
      ),
      crossFadeState:  !isOrder ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
