import 'package:suram/app/orders/orders_list/domain/models/order.dart';
import 'package:suram/app/orders/orders_list/infrastructure/repositories/order_service.dart';

import '../../../../global/global.dart';

final ordersProvider=Provider<OrderService>((ref)=>const OrderService());

final orderListProvider = FutureProvider<List<Order>>((ref) async {
  return ref.watch(ordersProvider).getOrders();
});