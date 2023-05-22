import 'package:latlong2/latlong.dart';

enum OrderType { veg, nonVeg, vegan }

enum OrderStatus { booked, pickedUp, cancelled }

class Order {
  String customerName;
  String customerPhone;
  OrderType orderType;
  DateTime orderTime;
  int serveCount;
  LatLng location = LatLng(0, 0);

  Order(
      {required this.customerName,
      required this.customerPhone,
      this.orderType = OrderType.nonVeg,
      required this.orderTime,
      this.serveCount = 1});
}
