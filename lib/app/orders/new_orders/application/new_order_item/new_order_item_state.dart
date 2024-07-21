import 'package:equatable/equatable.dart';

class NewOrderItemState extends Equatable {
  final String productName;
  final double count;
  final double price;
  final double amount;
  final String orderDate;
  final String comment;

  const NewOrderItemState({
    required this.productName,
    required this.count,
    required this.price,
    required this.amount,
    required this.orderDate,
    required this.comment,
  });

  String get representation => 'Product Name: $productName, Count: $count, Price: $price, Amount: $amount, Order Date: $orderDate, Comment: $comment';

  NewOrderItemState copyWith({

    String? productName,
    double? count,
    double? price,
    double? amount,
    String? orderDate,
    String? comment,
  }) {
    return NewOrderItemState(
      productName: productName ?? this.productName,
      count: count ?? this.count,
      price: price ?? this.price,
      amount: amount ?? this.amount,
      orderDate: orderDate ?? this.orderDate,
      comment: comment ?? this.comment,
    );
  }

  factory NewOrderItemState.initial() {
    return const NewOrderItemState(
      productName: '',
      count: 0,
      price: 0,
      amount: 0,
      orderDate: '',
      comment: '',
    );
  }

  @override
  List<Object?> get props => [
        productName,
        count,
        price,
        amount,
        orderDate,
        comment,
      ];

}
