import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sell/SingIn/sign_up.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/data/api/app_api.dart';
import 'package:sell/data/api/app_urls.dart';
import 'package:sell/models/app_user.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../HomeScreen/home_screen.dart';
import '../Navigation/navigation.dart';
import '../const/app_colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _secureText = true;
 late SimpleFontelicoProgressDialog _dialog ;

  // GetStorage authBox=GetStorage('authBox');



  BaseController baseController=BaseController();

  TextEditingController usernameCtrl=TextEditingController();
  TextEditingController passwordCtrl=TextEditingController();

final  AppApi appApi=AppApi();

  login()async{


    if(usernameCtrl.text.isNotEmpty&& passwordCtrl.text.isNotEmpty) {
      var data = {'email': usernameCtrl.text, 'password': passwordCtrl.text};
_dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);
      // await Future.delayed(Duration(seconds: 2));
      // print(data);
  var result= await   appApi.login(data);
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
  initState() {
    super.initState();
  }

  nav(){

  }

  @override
  Widget build(BuildContext context) {
   _dialog= SimpleFontelicoProgressDialog(context: context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: PreferredSize(
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              bottom: PreferredSize(
                preferredSize: Size(3, 60),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(7),
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text("تسجل الدخول",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 31,
                                  fontWeight: FontWeight.bold),
                              textDirection: TextDirection.rtl),
                        )),
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
                    height: 200,
                    child: Icon(
                      Icons.lock_person,
                      color: Colors.amber[700],
                      size: 100,
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
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.white))),
                                  child: TextField(
                                    textDirection: TextDirection.rtl,
                                    controller: usernameCtrl,
                                    inputFormatters: [FilteringTextInputFormatter.deny(' ')],

                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email),
                                        hintText: "الإيميل ",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
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
                                          onPressed: () {
                                            setState(() {
                                              _secureText = !_secureText;
                                            });
                                          },
                                        ),
                                        hintText: "كلمة المرور",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                    obscureText: _secureText,
                                  ),
                                )
                              ],
                              //),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        //FadeAnimation(2,
                        GestureDetector(
                          onTap: ()async{

                           await login();


                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                "تسجيل الدخول",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        //),
                        SizedBox(
                          height: 70,
                        ),
                        //FadeAnimation(1.5,
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("ليس لدي حساب"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return Sign_up();
                                  }),
                                );
                              },
                              child: Text(
                                "إنشاء حساب؟",
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            )
                          ],
                        ),

                        //),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
