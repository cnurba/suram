import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/order/order_state.dart';

class OrderController extends StateNotifier<OrderState> {
  OrderController() : super(OrderState.initial());

  Future<void> addOrder(String orderName) async {
    state = state.copyWith(orderName: orderName);
  }

  Future<void> addOrderItem(String item) async {
    state = state.copyWith(items: [...state.items, item]);
  }
}

final orderNotifierProvider =
    StateNotifierProvider<OrderController, OrderState>(
        (ref) => OrderController());
