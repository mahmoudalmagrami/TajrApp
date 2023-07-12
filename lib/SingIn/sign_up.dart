import 'package:flutter/material.dart';
import 'package:sell/SingIn/sign_in.dart';

import '../const/app_colors.dart';




class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool _secureText = true;
  bool _secureText2 = true;
  @override
  initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: AppBar(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            elevation: 0,
            centerTitle: true,


            bottom: PreferredSize(
              preferredSize: Size(3,60 ),
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.all(7),
                      child:
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Center(
                          child: Text("إنشاء حساب", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                        ),
                      )
                  ),



                ],

              ),

            ),

          ),
          preferredSize: Size.fromHeight(130),
        ),


        backgroundColor: Colors.grey[50],
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,

                  child: Icon(
                    Icons.person,color: Colors.amber[700],size: 100,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      //FadeAnimation(1.8,
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(90, 148, 251, .6),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10)
                                )
                              ]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.white))
                                ),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: Icon( Icons.person),
                                      hintText: "اسم المستخدم",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                ),
                              ),
                              //SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "رقم الموبايل",
                                      prefixIcon: Icon( Icons.phone),
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye),

                                        onPressed: (){
                                          setState(() {
                                            _secureText = !_secureText;
                                          });
                                        },
                                      ),
                                      hintText: "كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  obscureText: _secureText,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      prefixIcon: IconButton(
                                        icon: Icon(Icons.remove_red_eye),

                                        onPressed: (){
                                          setState(() {
                                            _secureText2 = !_secureText2;
                                          });
                                        },
                                      ),
                                      hintText: "تأكيد كلمة المرور",
                                      hintStyle: TextStyle(color: Colors.grey[400])
                                  ),
                                  obscureText: _secureText2,
                                ),
                              )
                            ],
                            //),
                          )),
                      SizedBox(height: 30,),
                      //FadeAnimation(2,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primaryColor,

                        ),
                        child: Center(
                          child: Text("إنشاء حساب", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),),
                        ),
                      ),
                      //),
                      SizedBox(height: 50,),
                      //FadeAnimation(1.5,
                      Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Text("لدي حساب بالفعل"),
                          TextButton(
                            onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Sign_in();
                            }
                            ),
                            );
                            },
                            child:
                            Text("  تسجيل الدخول؟", style: TextStyle(color: AppColors.primaryColor),
                            ),)


                        ],
                      ),



                      //),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
