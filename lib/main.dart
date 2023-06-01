import 'package:flutter/material.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/catagory.dart';
import 'package:news_app/Screen/View/dash_screen.dart';
import 'package:news_app/Screen/View/home_screen.dart';
import 'package:news_app/Screen/View/intro_screen.dart';
import 'package:news_app/Screen/View/splace_screen.dart';
import 'package:news_app/Screen/View/view_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        // initialRoute: 'view',
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplaceScreen(),
          'intro':(context) => IntroScreen(),
          'dash':(context) => DashScreen(),
          'home':(context) => HomeScreen(),
          'cat':(context) => CategoryScreen(),
          'view':(context) => ViewScreen(),
        },
      ),
    ),
  );
}
