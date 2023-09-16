import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sell/HomeScreen/home_screen.dart';
import 'package:sell/SingIn/sign_in.dart';
import 'package:sell/base_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Navigation/navigation.dart';
import '../const/app_colors.dart';
import '../data/api/app_api.dart';
import '../models/app_user.dart';




class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool _secureText = true;
  bool _secureText2 = true;

  late SimpleFontelicoProgressDialog _dialog ;

  // GetStorage authBox=GetStorage();

  BaseController baseController=BaseController();

  TextEditingController usernameCtrl=TextEditingController();
  TextEditingController emailCtrl=TextEditingController();
  TextEditingController phoneCtrl=TextEditingController();
  TextEditingController passwordCtrl=TextEditingController();
  TextEditingController confirmPasswordCtrl=TextEditingController();

  final  AppApi appApi=AppApi();

  register()async{


    if(usernameCtrl.text.isNotEmpty&&emailCtrl.text.isNotEmpty&& passwordCtrl.text.isNotEmpty&&phoneCtrl.text.isNotEmpty&&confirmPasswordCtrl.text.isNotEmpty) {
      var data = {'username':usernameCtrl.text,'email': emailCtrl.text, 'password': passwordCtrl.text,'phone_number':phoneCtrl.text,'status':'active'};

      print(data);
       _dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);

      var result= await   appApi.register(data);
      if(result['data'] !=null){


        AppUser user=AppUser.fromJson(result['data']);

        user.token=result['token'];

        var d=json.encode(user.toJson());

        await BaseController. authBox.write("user", d);

        BaseController.currentUser=user;



        Future.delayed(Duration(milliseconds: 100),(){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
              Navigation()), (Route<dynamic> route) => false);
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Navigation()));

        });




      }
      else{
        baseController.buildToastMsg(msg: result['message']);
      }
      _dialog.hide();
      print(result);



    }
    else{

      baseController.buildToastMsg(msg: 'Please fill all fields');

    }




  }

  @override
  initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _dialog= SimpleFontelicoProgressDialog(context: context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                    padding: EdgeInsets.only(top: 20),
                    height: 100,

                    child: Icon(
                      Icons.person,color: Colors.amber[700],size: 80,
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
                                    controller: usernameCtrl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon( Icons.person),
                                        hintText: "اسم المستخدم",
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                  ),
                                ),


                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.white))
                                  ),
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    controller: emailCtrl,
                                    textAlign: TextAlign.right,
                                    inputFormatters: [FilteringTextInputFormatter.deny(' ')]
                                    ,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon( Icons.email),
                                        hintText: " الإيميل",
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
                                    controller: phoneCtrl,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "رقم الموبايل",
                                        prefixIcon: Icon( Icons.phone),
                                        hintStyle: TextStyle(color: Colors.grey[400])
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    controller: passwordCtrl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.lock),

                                        suffixIcon: IconButton(
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
                                    controller: confirmPasswordCtrl,
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                                                               prefixIcon: Icon(Icons.lock),

                                        suffixIcon: IconButton(
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
                        GestureDetector(
                          onTap: (){
                            register();
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,

                            ),
                            child: Center(
                              child: Text("إنشاء حساب", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 17),),
                            ),
                          ),
                        ),
                        //),
                        SizedBox(height: 50,),
                        //FadeAnimation(1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text("لدي حساب بالفعل"),
                            TextButton(
                              onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context){
                                return SignIn();
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
      ),
    );
  }
}
