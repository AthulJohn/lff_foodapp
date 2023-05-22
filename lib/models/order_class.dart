enum OrderType { veg, nonVeg, vegan }

enum OrderStatus { booked, pickedUp, cancelled }

class Order {
  String customerName;
  String customerPhone;
  OrderType orderType;
  DateTime orderTime;
  int serveCount;

  Order(
      {required this.customerName,
      required this.customerPhone,
      this.orderType = OrderType.nonVeg,
      required this.orderTime,
      this.serveCount = 1});
}
