import 'dart:convert';

import 'package:coffee_bill_flutter/models/bill.dart';
import 'package:coffee_bill_flutter/models/order.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // static const String mode = 'local';
  static const String mode = 'dev';
  static const String baseUrl =
      mode == 'local' ? 'http://127.0.0.1:8001' : 'http://dindoo.cafe24app.com';
  static const String bills = 'bills';

  static Future<List<BillModel>> getAllBills() async {
    List<BillModel> billInstances = [];
    final url = Uri.parse('$baseUrl/$bills');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final bills = jsonDecode(response.body);
      for (var bill in bills) {
        billInstances.add(BillModel.fromJson(bill));
      }
      return billInstances;
    }
    throw Error();
  }

  static Future<BillModel> getBill(int billSeq) async {
    final url = Uri.parse("$baseUrl/$bills/$billSeq");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final bills = jsonDecode(response.body);
      return BillModel.fromJson(bills[0]);
    }
    throw Error();
  }

  static Future<List<OrderModel>> getAllOrders(int billSeq) async {
    List<OrderModel> orderInstances = [];
    final url = Uri.parse("$baseUrl/$bills/$billSeq/orders");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final orders = jsonDecode(response.body);
      for (var order in orders) {
        orderInstances.add(OrderModel.fromJson(order));
      }
      return orderInstances;
    }
    throw Error();
  }
}
