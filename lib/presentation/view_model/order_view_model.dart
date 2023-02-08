import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/api/order_api.dart';
import '../../data/model/add_order_model.dart';
import '../../data/model/add_product_model.dart';
import '../../data/model/order_model.dart';

enum OrderViewState { none, loading, error }

class OrderViewModel extends ChangeNotifier {
  OrderViewState _state = OrderViewState.none;
  OrderViewState get state => _state;

  changeState(OrderViewState state) {
    _state = state;
    notifyListeners();
  }

  String formattedDate = DateFormat('y-MM-dd').format(DateTime.now());

  List<OrderModel>? _dataOrder;
  List<OrderModel>? get dataOrder => _dataOrder;

  List<AddProduct>? _selectedData;
  List<AddProduct>? get selectedData => _selectedData;

  OrderModel? _selectedOrder;
  OrderModel? get selectedOrder => _selectedOrder;

  set addSelectedData(AddProduct product) {
    if (_selectedData != null) {
      _selectedData!.add(product);
    } else {
      _selectedData = [product];
    }

    notifyListeners();
  }

  void deleteSelectedData(AddProduct product) {
    if (_selectedData != null && _selectedData!.isNotEmpty) {
      _selectedData!.remove(product);
    }

    notifyListeners();
  }

  void clearSelectedData() {
    _selectedData = null;
    _selectedOrder = null;
  }

  List<List<dynamic>> dataProductList(String category) {
    List<List<dynamic>> data = [];
    if (_selectedData != null && _selectedData!.isNotEmpty) {
      for (var element in _selectedData!) {
        if (element.category == category) {
          data.add([
            0,
            0,
            {"product_id": element.productId, "qty": element.qty}
          ]);
        }
      }
    }

    return data;
  }

  Future getAllData() async {
    _dataOrder = null;
    changeState(OrderViewState.loading);
    try {
      final data = await OrderAPI.getAllOrder();

      if (data["status"] == "oke") {
        final Map<String, dynamic> response =
            data["response"] as Map<String, dynamic>;
        _dataOrder = (response["result"]["data"] as List)
            .map((e) => OrderModel.fromJson(e))
            .toList();
        notifyListeners();
        changeState(OrderViewState.none);
      } else {
        throw data["response"];
      }
    } catch (error) {
      changeState(OrderViewState.error);
      return throw Exception("Error $error");
    }
  }

  Future<String> addOrder(String desc) async {
    try {
      final AddOrder newOrder = AddOrder(
          description: desc,
          date: formattedDate,
          fromIds: dataProductList("from ids"),
          toIds: dataProductList("to ids"),
          byproductIds: dataProductList("byproduct ids"));

      final Map<String, List> dataNewOrder = {
        "data": [newOrder]
      };

      final data = await OrderAPI.addOrder(dataNewOrder);

      if (data["status"] == "oke") {
        _selectedData = null;
        return "Data saved successfully";
      } else {
        return data["response"];
      }
    } catch (err) {
      return throw Exception("Error $err");
    }
  }

  void detailData(OrderModel order) {
    _selectedOrder = order;

    final List<AddProduct> fromIds = order.fromIds
        .map((e) => AddProduct(
            productId: e.productId[0],
            productName: e.productId[1],
            qty: e.qty,
            category: "from ids"))
        .toList();

    final List<AddProduct> toIds = order.toIds
        .map((e) => AddProduct(
            productId: e.productId[0],
            productName: e.productId[1],
            qty: e.qty,
            category: "to ids"))
        .toList();

    final List<AddProduct> byProductIds = order.byproductIds
        .map((e) => AddProduct(
            productId: e.productId[0],
            productName: e.productId[1],
            qty: e.qty,
            category: "byproduct ids"))
        .toList();

    _selectedData = [...fromIds, ...toIds, ...byProductIds];
    notifyListeners();
  }

  Future deleteData() async {
    try {
      final data = await OrderAPI.deleteOrder(_selectedOrder!.id);

      if (data["status"] == "oke") {
        return "Data deleted successfully";
      } else {
        return data["response"];
      }
    } catch (error) {
      return throw Exception("Error $error");
    }
  }
}
