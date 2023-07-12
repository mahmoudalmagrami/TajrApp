import 'package:flutter/material.dart';
import 'package:sell/SingIn/sign_in.dart';

import '../const/app_colors.dart';


class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Container(

        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                  color:AppColors. primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              height: 110.0,
              width: 420.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        Text("الحساب",style:TextStyle(color: Colors.white,
                          fontSize: 30,fontWeight: FontWeight.bold,),)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 300,
              width: 390,
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(''),
                      leading: Icon(Icons.shopping_cart_sharp,color: Colors.amber[700],),
                      trailing: Text('طلباتي',style:
                      TextStyle(color:AppColors. primaryColor, fontWeight: FontWeight.w800,fontSize: 17)),
                      onTap: (){
                        print('Tapped');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(''),
                      leading: Icon(Icons.location_on,color: Colors.amber[700],),
                      trailing: Text('عناويني',style: TextStyle(color:AppColors. primaryColor, fontWeight: FontWeight.w800,fontSize: 17)),
                      onTap: (){
                        print('Tapped');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(''),
                      leading: Icon(Icons.favorite,color: Colors.amber[700],),
                      trailing: Text('مفضلتي',style: TextStyle(color:AppColors. primaryColor, fontWeight: FontWeight.w800,fontSize: 17)),
                      onTap: (){
                        print('Tapped');
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(''),
                      leading: Icon(Icons.exit_to_app,color: Colors.amber[700],),
                      trailing: Text('تسجيل خروج',style: TextStyle(
                          color:AppColors. primaryColor, fontWeight: FontWeight.w800,fontSize: 17)),
                      onTap: (){
                        print('Tapped');
                      },

                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );


  }
}
Widget _head() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 240,
            decoration: BoxDecoration(
              color: Color(0xff368983),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 340,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Color.fromRGBO(250, 250, 250, 0.1),
                      child: Icon(
                        Icons.notification_add_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 35, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good afternoon',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color.fromARGB(255, 224, 223, 223),
                        ),
                      ),
                      Text(
                        'Enjelin Morgeana',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 140,
        left: 37,
        child: Container(
          height: 170,
          width: 320,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(47, 125, 121, 0.3),
                offset: Offset(0, 6),
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
            color: Color.fromARGB(255, 47, 125, 121),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Balance',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text('',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Color.fromARGB(255, 85, 145, 141),
                          child: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Income',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 13,
                          backgroundColor: Color.fromARGB(255, 85, 145, 141),
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                            size: 19,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Expenses',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 216, 216, 216),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
