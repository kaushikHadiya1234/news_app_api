import 'package:flutter/material.dart';
import 'package:news_app/utils/sharedpref.dart';

class SplaceScreen extends StatefulWidget {
  const SplaceScreen({Key? key}) : super(key: key);

  @override
  State<SplaceScreen> createState() => _SplaceScreenState();
}

class _SplaceScreenState extends State<SplaceScreen> {
  bool? Status;
  @override
  void initState() {
    super.initState();
    outdata();
  }

  Future<void> outdata()
  async {
    SharedPref shr = SharedPref();
     Status = await shr.Readdata();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() =>Status==true? Navigator.pushReplacementNamed(context, 'dash'):Navigator.pushReplacementNamed(context, 'intro'));
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Image.asset('assets/images/logo.png',height: 66,width: 217,),
        ),
      ),
    );
  }
}
