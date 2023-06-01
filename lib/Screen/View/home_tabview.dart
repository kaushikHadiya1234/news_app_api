import 'package:flutter/material.dart';
import 'package:news_app/Screen/Model/news_model.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:provider/provider.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<NewsProvider>(context,listen: false);
    pt = Provider.of<NewsProvider>(context,listen: true);
    return Scaffold(
        body: FutureBuilder(
          future: pt!.GetData(cat: '${pt!.l1[pt!.select]}'),
          builder: (context, snapshot) {
            if(snapshot.hasError)
            {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/n1.png',height: 80,width: 80,),
                    Text("Check your internet Conection",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 3),
                    Text("Please on mobile data",style: TextStyle(fontSize: 15),),
                  ],
                ),
              );
            }
            else if(snapshot.hasData) {
              NewsModel newsModel = snapshot.data!;
              return ListView.builder(itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'view',arguments: index);
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage("${newsModel.article![index].urlToImage}"),fit: BoxFit.fill
                            ),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Expanded(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("${newsModel.article![index].author}",style: TextStyle(fontSize: 12,color: Colors.grey),),
                                SizedBox(height: 5),
                                Text('${newsModel.article![index].title}'),
                                SizedBox(height: 5),
                                Text("${newsModel.article![index].publishedAt}",style: TextStyle(fontSize: 12,color: Color(0xff4E4B66),fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
                itemCount: 3,
                physics: NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        )
    );
  }
}

/*
*
* */
