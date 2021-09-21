import 'package:flutter/material.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'functions.dart';

class Edit extends StatefulWidget {
  String ID,URL,ProductName,discrription;
  bool favorite;
  int price;
  Edit({this.ID,this.URL,this.ProductName,this.favorite,this.price,this.discrription});
  @override
  _EditState createState() => _EditState();
}


class _EditState extends State<Edit> {

  var name = TextEditingController();
  var discr = TextEditingController();
  var price = TextEditingController();
  var url = TextEditingController();


  @override
  Widget build(BuildContext context) {

    name.text=widget.ProductName;
    discr.text=widget.discrription;
    price.text=widget.price.toString();
    url.text=widget.URL;
    bool fav=false;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: ()=>Navigator.pop(context),
        ),
        title: widget.ID==null?Text('Add Product'):Text('Edit Product'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              child: Icon(Icons.save),
              onTap: (){
                  widget.ID==null?Provider.of<MyShop>(context,listen:false).add(name.text, discr.text, url.text,int.parse(price.text),fav):
                Provider.of<MyShop>(context,listen:false).Edit(widget.ID,name.text,discr.text,url.text, int.parse(price.text));

                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context){return Home();}), (_) => false);}

            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            TextField(
              controller: name,

              style: TextStyle(
                color:Colors.black
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide()
                ),
                  labelText: 'Product Name',
                hintStyle: TextStyle(
                    color:Colors.black
                ),
                labelStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
              color: Colors.black
            ),
              height: 14,),
            SizedBox(height: 10,),

            TextField(
              controller: price,
              // onChanged: (value){
              //   price=int.parse(value);
              // },
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'Price',
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black
                  )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
              height: 14,),
            SizedBox(height: 10,),
            TextField(
              controller: discr,
              enableInteractiveSelection: true,
              minLines: 3,
              maxLines: 5,
              // onChanged: (value){
              //   description=value;
              // },
              style: TextStyle(
                  color:Colors.black
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'Description',
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black
                  )
              ),
            ),

            SizedBox(
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
              height: 14,),
            SizedBox(height: 10,),
            TextField(
              controller: url,
              enableInteractiveSelection: true,
              minLines: 3,
              maxLines: 5,
              // onChanged: (value){
              //   url=value;
              // },
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide()
                  ),
                  labelText: 'URL',
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                  labelStyle: TextStyle(
                      color: Colors.black
                  )
              ),
            ),
            SizedBox(
              child: Divider(
                thickness: 1,
                color: Colors.black,
              ),
              height: 14,),
          ],
        ),
      ),
    );
  }
}
