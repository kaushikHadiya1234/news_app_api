import 'package:flutter/material.dart';
import 'package:news_app/Screen/Model/news_model.dart';
import 'package:news_app/Screen/View/home_screen.dart';
import 'package:news_app/utils/api_helper.dart';

class NewsProvider extends ChangeNotifier {
  int select = 0;

  List ScreenList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int i=0;
  void ChangeIndex(int index)
  {
    i=index;
    notifyListeners();
  }

  List l1 = [
    'business',
    'sport',
    'politics',
    'business',
    'health',
    'science',
  ];

  void Changecategory(int value) {
    select = value;
    // print(select);
    // print(value);
    notifyListeners();
  }

  Future<NewsModel> GetData({required String? cat}) async {
    return await Apihleper.apihleper.Apihelperdata(category: cat);
  }

  bool? bookmark=false;

  void saveNews()
  {
    if(bookmark==false)
      {
        bookmark=true;
      }
    else
      {
        bookmark=false;
      }
    notifyListeners();
  }

  void ChangeNext()
  {

  }
}
