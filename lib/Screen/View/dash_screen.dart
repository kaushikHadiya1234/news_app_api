import 'package:flutter/material.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:news_app/utils/sharedpref.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<NewsProvider>(context, listen: false);
    pt = Provider.of<NewsProvider>(context, listen: true);
    return SafeArea(
        child: Scaffold(
      body: pt!.ScreenList[pt!.i],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0xff1877F2),
            unselectedItemColor: Color(0xff4E4B66),
            type: BottomNavigationBarType.fixed,
            currentIndex: pt!.i,
            onTap: (value) {
              SharedPref sharedPref=SharedPref();
              pf!.ChangeIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.explore),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark_border),label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp),label: ''),
            ],
          ),
    ));
  }
}
