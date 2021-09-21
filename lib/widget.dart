import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'functions.dart';
 class widget extends StatelessWidget {
    String ID ,URL,ProductName;
    bool favorite;
    widget({@required this.ID,@required this.URL,@required this.ProductName,@required this.favorite,});
    @override
   Widget build(BuildContext context) {
     return Container(
       width: MediaQuery.of(context).size.height,
       height: MediaQuery.of(context).size.height,
       margin: EdgeInsets.all(10),
       decoration: BoxDecoration(
         borderRadius:BorderRadiusDirectional.circular(35),
          color:Colors.grey,
       ),
       child: Column(
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
         color:Colors.grey[400],
             border: Border.all(color: Colors.transparent),
           ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 GestureDetector(
                   onTap:()
                       {
                         Provider.of<MyShop>(context,listen:false).change(ID);
                       },
                   child: Padding(
                     padding: const EdgeInsets.only(right: 9,top: 5),
                     child: Icon(favorite==false?Icons.favorite_border_outlined:Icons.favorite,
                       color:  Colors.red,
                       size: 40,
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Expanded(
              child:Image(image:NetworkImage(URL)),
           ),
           Center(
             child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      color:Colors.grey[400],
      ),
               child: Center(
                 child: Text(ProductName,style: TextStyle(
                   fontSize: 20,
                     color: Colors.black
                 ),),
               ),
             ),
           ),
         ],
       ),
     );
   }
 }
