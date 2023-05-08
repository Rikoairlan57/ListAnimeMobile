import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:listanime/models/home_anime.dart';

class AnimeProvider extends ChangeNotifier {
  List<HomeAnime> _animes = [];
  final _dio = Dio();
}
