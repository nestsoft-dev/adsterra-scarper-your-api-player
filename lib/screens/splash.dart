import 'package:adsterra/screens/webscraped.dart';
import 'package:flutter/material.dart';

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 4000)).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AdsterraFeeds()));
    });
    return Scaffold(
      backgroundColor: Colors.red,
    );
  }
}
