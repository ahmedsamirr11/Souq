import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/functions.dart';
import 'edit.dart';

class Cardlist extends StatelessWidget {
  String ID,URL,Productname,Descrption;
  int price;
  bool favorite;
  Cardlist({this.ID,this.URL,this.Productname,this.favorite,this.Descrption,this.price});
  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.grey[200],
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child:Image(image:NetworkImage(URL), errorBuilder: (BuildContext context, Object exception, StackTrace stackTrace) {
              return Icon(Icons.error_outline);
            },
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(Productname,style: TextStyle(color: Colors.black),),
              SizedBox(width: 180),
              GestureDetector(child: Icon(Icons.edit,color:Colors.pink,),
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context){return Edit(ID: ID,ProductName: Productname,URL: URL,price: price,discrription: Descrption,favorite: favorite,);}));
                  }

              ),
              SizedBox(width: 3,height:10,child: Divider(thickness: 2,color: Colors.grey,),),
              GestureDetector(child: Icon(Icons.delete,color:Colors.red),
                onTap: (){
                  Provider.of<MyShop>(context, listen: false).remove(ID);
                },
              ),
            ],
          ),
        ),

      ),

    );
  }
}
