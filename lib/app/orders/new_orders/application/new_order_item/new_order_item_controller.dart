import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/new_order_item/new_order_item_state.dart';
class NewOrderController extends StateNotifier<NewOrderItemState> {
  NewOrderController() : super(NewOrderItemState.initial());

  Future<void> updateProductName(String productName) async {
    state = state.copyWith(productName: productName);
  }

  Future<void> updateCount(double count) async {
    state = state.copyWith(count: count);
  }

  Future<void> updatePrice(double price) async {
    state = state.copyWith(price: price);
  }

  Future<void> updateAmount(double amount) async {
    state = state.copyWith(amount: amount);
  }
}

final newOrderItemNotifierProvider =
    StateNotifierProvider<NewOrderController, NewOrderItemState>(
        (ref) => NewOrderController());
