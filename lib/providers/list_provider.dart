import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListProvider extends ChangeNotifier {
  // List _items = [
  //   {"id": 1, "text": "Milk"},
  //   {"id": 2, "text": "Eggs"},
  //   {"id": 3, "text": "Bread"},
  //   {"id": 4, "text": "Juice"},
  // ];

  List _items = [];
  String api = "http://10.22.8.29:3000";

  List get items => _items;

  fetchItems() async {
    Uri uri = Uri.parse(api + '/items');
    try {
      final resp = await http.get((uri));
      final data = jsonDecode(resp.body);
      var itemsData = data['data'] as List;
      _items = itemsData
          .map((item) => {"id": item['_id'], "text": item['text']})
          .toList();
      notifyListeners();
    } catch (err) {
      print(err);
    }
  }

  void addItem(item) async {
    Uri uri = Uri.parse(api + '/items');
    try {
      final resp = await http.post(
        (uri),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(item),
      );
      final data = jsonDecode(resp.body);
      var itemData = data['data'] as List;

      final mappedItem = itemData
          .map((item) => {"id": item['_id'], "text": item['text']})
          .toList()
          .first;

      _items.add(mappedItem);
    } catch (err) {
      print(err);
    }

    notifyListeners();
  }

  void deleteItem(id) async {
    Uri uri = Uri.parse(api + '/items');
    try {
      await http.delete(
        (uri),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id": id}),
      );
      _items.removeWhere((item) => item['id'] == id);
    } catch (err) {
      print(err);
    }
    notifyListeners();
  }
}
