import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import '../models/search_model.dart';

class SearchProvider extends ChangeNotifier {
  String _title = '';
  String get title {
    return _title;
  }

  void title_removed() {
    _searchList = [];
    _title = '';
  }

  List<SearchModel> _searchList = [];
  List<SearchModel> get searchList {
    return _searchList;
  }

  void TriggerSearch(String title) {
    _title = title;
    notifyListeners();
  }

  Future<void> searchData() async {
    List<SearchModel> list = [];
    final url = "https://api.jikan.moe/v4/anime?q=$_title&limit=12";
    final response = await Dio().get(url);
    for (var item in response.data['data']) {
      final searchItem = SearchModel.fromJson(item);
      list.add(searchItem);
    }
    _searchList = list;
  }
}
