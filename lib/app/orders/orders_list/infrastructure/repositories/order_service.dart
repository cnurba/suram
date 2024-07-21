
import 'package:suram/app/orders/orders_list/domain/models/order.dart';

class OrderService {
  const OrderService();

  Future<List<Order>> getOrders() async {
    List<Order> orders = [
      Order(id: 1, amount: 5000, status: "Новый", date: DateTime.now()),
      Order(id: 2, amount: 15000, status: "Согласован 1", date: DateTime.now()),
      Order(id: 3, amount: 25000, status: "Согласован 2", date: DateTime.now()),
      Order(id: 11, amount: 36505.50, status: "Получен", date: DateTime.now()),
      Order(id: 15, amount: 150, status: "Утвержден", date: DateTime.now()),
      Order(id: 16, amount: 158200, status: "Оплачен", date: DateTime.now()),
    ];
    return orders;
  }

}
