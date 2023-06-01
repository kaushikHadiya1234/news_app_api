import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Screen/Model/news_model.dart';
class Apihleper
{
static Apihleper apihleper =Apihleper();
  Future<NewsModel> Apihelperdata({required String? category})
  async {
    String? link = 'https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=1f4f5f9f7b184d62803561e51533600e';
    var resource = await http.get(Uri.parse(link));
    var json = jsonDecode(resource.body);

    NewsModel newsModel = await NewsModel.fromJson(json);

    return newsModel;

  }

}