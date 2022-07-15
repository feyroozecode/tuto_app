import 'package:flutter/material.dart'; // class 
import 'package:mon_app/HomePage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget{ 

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      // copilot write me a home page :) 
      home: HomePage(), 
      debugShowCheckedModeBanner: false,
    );
  }

}