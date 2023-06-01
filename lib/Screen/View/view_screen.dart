import 'package:flutter/material.dart';
import 'package:news_app/Screen/Model/news_model.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:provider/provider.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<NewsProvider>(context, listen: false);
    pt = Provider.of<NewsProvider>(context, listen: true);
    int d = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            size: 20,
                          )),
                      IconButton(
                          onPressed: () {
                            pf!.saveNews();
                          },
                          icon: Icon(
                            pt!.bookmark == false
                                ? Icons.bookmark_border
                                : Icons.bookmark,
                            size: 25,
                          )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: pt!.GetData(cat: '${pt!.l1[pt!.select]}'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/n1.png',
                              height: 100,
                              width: 100,
                            ),
                            Text(
                              "Check your internet Conection",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Please on mobile data",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    NewsModel newsModel = snapshot.data!;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                "${newsModel.article![d].source!.name}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Text(
                                "${newsModel.article![d].publishedAt}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey),
                              ),
                              trailing: ElevatedButton(
                                onPressed: () {},
                                child: Text("Following"),
                              )),
                          SizedBox(height: 10),
                          Container(
                              height: 248,
                              width: 380,
                              child: Image.network(
                                "${newsModel.article![d].urlToImage}",
                                fit: BoxFit.fill,
                              )),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("India",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Colors.grey))),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "${newsModel.article![d].title}",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w400),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "${newsModel.article![d].description}",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff4E4B66)),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "${newsModel.article![d].content}",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff4E4B66)),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
