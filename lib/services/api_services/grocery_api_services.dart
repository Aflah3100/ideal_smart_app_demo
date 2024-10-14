import 'dart:convert';

import 'package:flutter/services.dart' as the_bundle;
import 'package:ideal_smart_app_demo/models/grocery_item_model.dart';
import 'package:ideal_smart_app_demo/utils/assets.dart';

class GroceryApiServices {
  GroceryApiServices._internal();
  static GroceryApiServices instance = GroceryApiServices._internal();
  factory GroceryApiServices() => instance;

  Future<List<GroceryItemModel>> fetchGroceryItems() async {
    final groceryData =
        await the_bundle.rootBundle.loadString(Assets.groceryItemsJson);

    final jsonData = jsonDecode(groceryData) as List;

    return jsonData
        .map((element) => GroceryItemModel.fromJson(element))
        .toList();
  }

  Future<List<GroceryItemModel>> fetchTopOfferItems() async {
    final groceryData =
        await the_bundle.rootBundle.loadString(Assets.topOfferItemsJson);

    final jsonData = jsonDecode(groceryData) as List;

    return jsonData
        .map((element) => GroceryItemModel.fromJson(element))
        .toList();
  }
}
