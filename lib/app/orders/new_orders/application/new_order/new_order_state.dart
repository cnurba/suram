import 'package:equatable/equatable.dart';
import 'package:suram/global/extension/date_extensions.dart';

class NewOrderState extends Equatable {
  final String orderName;
  final String blockName;
  final String dueDate;
  final String orderDate;
  final bool hasOrder;

  const NewOrderState({
    required this.orderName,
    required this.blockName,
    required this.dueDate,
    required this.orderDate,
    this.hasOrder = false,
  });

  String get representation => 'Order Name: $orderName, Block Name: $blockName, Due Date: $dueDate, Order Date: $orderDate';

  NewOrderState copyWith({
    String? orderName,
    String? blockName,
    String? dueDate,
    String? orderDate,
    bool? hasOrder,
  }) {
    return NewOrderState(
      orderName: orderName ?? this.orderName,
      blockName: blockName ?? this.blockName,
      dueDate: dueDate ?? this.dueDate,
      orderDate: orderDate ?? this.orderDate,
      hasOrder: hasOrder ?? this.hasOrder,
    );
  }

  factory NewOrderState.initial() {
    return NewOrderState(
      orderName: '',
      blockName: '',
      dueDate: '',
      orderDate: DateTime.now().toFormattedString(),
      hasOrder: false,
    );
  }

  @override
  List<Object?> get props => [
        orderName,
        blockName,
        dueDate,
        orderDate,
        hasOrder,
      ];
}
