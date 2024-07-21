import 'package:equatable/equatable.dart';


class Order extends Equatable {
  const Order({
    required this.id,
    required this.amount,
    required this.status,
    required this.date,
  });
  final int id;
  final double amount;
  final String status;
  final DateTime date;

  @override
  List<Object?> get props => [id, amount, status, date];
}