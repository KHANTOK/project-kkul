import 'package:flutter/cupertino.dart';
import 'package:kkul_app/model/items_fav.dart';

class FavoriteBloc {
  List<ItemModel> items = [];

  void addItems(ItemModel data) {
    items.add(data);
    // notifyListeners();
  }

  List<ItemModel> get devices {
    return items;
  }
}
