import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:news_app/Screen/Provider/news_provider.dart';
import 'package:news_app/Screen/View/all_screen.dart';
import 'package:news_app/utils/sharedpref.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<NewsProvider>(context, listen: false);
    pt = Provider.of<NewsProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          onDone: () {
            SharedPref shredPref =SharedPref();
            shredPref.getGata();
            Navigator.pushReplacementNamed(context, 'dash');
          },
          showSkipButton: true,
          showNextButton: true,
          showDoneButton: true,
          next:  Text("Next"),
          done: Text("Done"),
          skip: Text("Skip"),
          pages: [
            PageViewModel(image: Container(height: 250,width: 250,child: Image.asset('assets/images/i1.png',fit: BoxFit.fill,)),title: "Learn to Crypto currency",body:"Cryptocurrency is a digital payment system that doesn't rely on banks to verify transactions"),
            PageViewModel(image: Container(height: 250,width: 250,child: Image.asset('assets/images/i2.png',fit: BoxFit.fill,)),title: "Learn to beautiful place",body:"The Indian early medieval age, from 600 to 1200 CE, is defined by regional kingdoms and cultural diversity"),
            PageViewModel(image: Container(height: 250,width: 250,child: Image.asset('assets/images/i3.png',fit: BoxFit.fill,)),title: "Learn to Health related",body:"Cryptocurrency is a digital payment system that doesn't rely on banks to verify transactions"),
          ],
        ),
      ),
    );
  }
}
