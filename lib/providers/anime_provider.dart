import 'package:flutter/material.dart';
import '../models/anime_model.dart';
import '../constant/const.dart';
import 'package:dio/dio.dart';
import '../models/home_anime.dart';

class AnimeProvider extends ChangeNotifier {
  List<HomeAnime> _animes = [];
  final _dio = Dio();

  List<HomeAnime> get animes {
    return _animes;
  }

  Future<void> fetchData() async {
    List<HomeAnime> temp = [];
    const url = "$JIKAN_URL/recommendations/anime";
    Response userData = await _dio.get(url);
    for (var data in userData.data['data']) {
      for (var anime in data['entry']) {
        HomeAnime animedata = HomeAnime.fromJson(anime);
        temp.add(animedata);
      }
    }
    _animes = temp;
  }

  Future<List<HomeAnime>> getTop() async {
    List<HomeAnime> temp = [];
    const url = "$JIKAN_URL/top/anime";
    Response userData = await _dio.get(url);
    for (var anime in userData.data['data']) {
      HomeAnime animedata = HomeAnime.fromJson(anime);
      temp.add(animedata);
    }
    return temp;
  }

  Future<AnimeModel> fetchDetails(String id) async {
    final url = "$JIKAN_URL/anime/$id/full";
    final response = await Dio().get(url);

    final anime = AnimeModel.fromJson(response.data["data"]);
    return anime;
  }
}
