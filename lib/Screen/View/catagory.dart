import 'package:flutter/material.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<NewsProvider>(context,listen: false);
    pt = Provider.of<NewsProvider>(context,listen: true);
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/images/name.png",height: 30,),
                    Icon(Icons.notifications_outlined)
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(alignment: Alignment.centerLeft,child: Text("Latest",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              SizedBox(height: 10),
              TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (value) {
                    pf!.Changecategory(value);
                  },
                  tabs: [
                    Tab(text: "All"),
                    Tab(text: "Sport",),
                    Tab(text: "Politics",),
                    Tab(text: "Bussiness",),
                    Tab(text: "Health",),
                    Tab(text: "Science",),
                  ]),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  height: 500,
                  child: TabBarView(physics: NeverScrollableScrollPhysics(),children: [
                    AllScreen(),
                    AllScreen(),
                    AllScreen(),
                    AllScreen(),
                    AllScreen(),
                    AllScreen(),
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
