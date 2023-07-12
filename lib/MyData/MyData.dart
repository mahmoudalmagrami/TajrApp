import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';

class MyData extends StatelessWidget {
  const MyData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.scaffoldColor,
      appBar: AppBar(),
      body: Container(

          child: Column(
            children: <Widget>[

               SizedBox(height: 10,),
               Container(
                 color: Colors.white,
                 child: TextField(
                   textDirection: TextDirection.rtl,
                   textAlign: TextAlign.right,
                   decoration: InputDecoration(

                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0),
                       ),
                       hintText: "رقم الهاتف",
                       hintStyle: TextStyle(color: Colors.blue[400])
                   ),
                 ),
               ),


        Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black))
    ),


    ),
              SizedBox(height: 10,),
              Container(

                color: Colors.white,
                child: TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "رقم الهاتف",
                      hintStyle: TextStyle(color:AppColors.iconcolor)
                  ),
                ),
              ),
            ],
            //),
          )),

    );

  }
}
