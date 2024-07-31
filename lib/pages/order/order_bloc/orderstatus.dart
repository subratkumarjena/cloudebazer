enum OrderStatus {
  order,
  packed,
  shipped,
  transport,
  delivered,
  canceled;

  static OrderStatus fromInt(int value) {
    switch (value) {
      case 1:
        return OrderStatus.order;
      case 2:
        return OrderStatus.packed;
      case 3:
        return OrderStatus.shipped;
      case 4:
        return OrderStatus.transport;
      case 5:
        return OrderStatus.delivered;
      case 6:
        return OrderStatus.canceled;
      default:
        throw Exception('Invalid order status value');
    }
  }

  String get description {
    switch (this) {
      case OrderStatus.order:
        return 'Order';
      case OrderStatus.packed:
        return 'Packed';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.transport:
        return 'Transport';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.canceled:
        return 'Canceled';
    }
  }

  int get value {
    switch (this) {
      case OrderStatus.order:
        return 1;
      case OrderStatus.packed:
        return 2;
      case OrderStatus.shipped:
        return 3;
      case OrderStatus.transport:
        return 4;
      case OrderStatus.delivered:
        return 5;
      case OrderStatus.canceled:
        return 6;
    }
  }
}
