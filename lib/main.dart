import 'package:flutter/material.dart';
import 'package:project/home.dart';
import 'package:provider/provider.dart';
import 'functions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: MyShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.pinkAccent[700],
          scaffoldBackgroundColor:Colors.white,
          canvasColor: Colors.pinkAccent[700],
        ),

        home: Home(),
      ),
    );
  }
}