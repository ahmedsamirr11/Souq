import 'package:flutter/material.dart';
import 'package:project/list.dart';
import 'package:provider/provider.dart';
import 'functions.dart';
import 'package:project/Fav.dart';
import 'pscreen.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex=0;
  List<dynamic> pages;
  void changepage(int index){
    setState(() {
      currentindex=index;
    });
  }
  @override
  void initState() {
    super.initState();
pages=[
  {
    'icon':Icons.app_registration,
    'title':'My Shop',
    'page':Screen(),
  },
  {
    'icon':null,
    'title':'My Favorite',
    'page':Fav(),
  }
];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pages[currentindex]['title']),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Listtp();
                },
                ),
                );
              },
              child: Icon(pages[currentindex]['icon']),
            ),
          ),
        ],
      ),
      body:FutureBuilder(
        future: Provider.of<MyShop>(context).getdata(),
        builder: (ctx,snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return pages[currentindex]['page'];
          }else {
            return Container(
              child: Center(child: CircularProgressIndicator()),);
          }
            },),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 50,
        selectedFontSize: 17,
        currentIndex:currentindex,
        onTap:changepage,
        selectedItemColor: Colors.grey[800],
        unselectedItemColor: Colors.white,
        items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Shop',
        ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),
          label: 'Favorite',
          ),

        ],),
    );
  }
}
