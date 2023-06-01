import 'package:flutter/material.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:news_app/Screen/View/home_tabview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset("assets/images/Icon.png",height: 5,),
                    )
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {}, child: Text("See all",style: TextStyle(fontSize: 14,color: Colors.grey),))
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 279,
                width: 380,
                child: Image.asset("assets/images/Cards.png"),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Latest",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    TextButton(onPressed: () {
                      Navigator.pushNamed(context, 'cat');
                    }, child: Text("See all",style: TextStyle(fontSize: 14,color: Colors.grey),))
                  ],
                ),
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
              Container(height: 340,
                child: TabBarView(physics: NeverScrollableScrollPhysics(),children: [
                 HomeTabScreen(),
                 HomeTabScreen(),
                 HomeTabScreen(),
                 HomeTabScreen(),
                 HomeTabScreen(),
                 HomeTabScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
