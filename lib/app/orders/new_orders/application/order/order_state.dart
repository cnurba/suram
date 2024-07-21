import 'package:equatable/equatable.dart';

class OrderState extends Equatable{
  final String orderName;
  final List<String> items;

  const OrderState({
    required this.orderName,
    required this.items,
  });

  OrderState copyWith({
    String? orderName,
    List<String>? items,
  }) {
    return OrderState(
      orderName: orderName ?? this.orderName,
      items: items ?? this.items,
    );
  }

  factory OrderState.initial() {
    return OrderState(
      orderName: '',
      items: [],
    );
  }

  @override
  List<Object?> get props => [
    orderName,
    items,
  ];

}