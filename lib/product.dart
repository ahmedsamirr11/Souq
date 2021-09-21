import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions.dart';
class ProdcutD extends StatefulWidget {
  String id,productname,description;
  int price;

  ProdcutD({@required this.id,@required this.productname,@required this.description,@required this.price});
  @override
  _ProdcutDState createState() => _ProdcutDState();
}

class _ProdcutDState extends State<ProdcutD> {
  @override
  Widget build(BuildContext context) {
    var products = Provider.of<MyShop>(context).all();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image(
              image: NetworkImage(products.firstWhere((element) => element.ID==widget.id).URL),
            ),
          ),
          ListTile(
            leading: Icon(Icons.attach_money_outlined,color: Colors.black,size: 30,),
          title: Text('${widget.price}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),)),
          ListTile(
              title: Text('${widget.description}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),))
        ],
      ),
    );
  }
}
