import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:suram/app/orders/new_orders/application/new_order/new_order_state.dart';

class NewOrderController extends StateNotifier<NewOrderState>{
  NewOrderController() : super(NewOrderState.initial());

  Future<void> updateOrderName(String orderName) async {
    state = state.copyWith(orderName: orderName, hasOrder: state.blockName.isNotEmpty && state.dueDate.isNotEmpty);
  }

  Future<void> updateBlockName(String blockName) async {
    state = state.copyWith(blockName: blockName,hasOrder: state.blockName.isNotEmpty && state.dueDate.isNotEmpty);
  }

  Future<void> updateDueDate(String dueDate) async {
    state = state.copyWith(dueDate: dueDate);
  }
}

final newOrderNotifierProvider = StateNotifierProvider<NewOrderController, NewOrderState>((ref) => NewOrderController());