import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/AccountPage/profile_page.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/map_page/map_page.dart';

import '../Locations/Locations.dart';
import '../MyData/MyData.dart';
import '../MyOrderPage/OrderPage.dart';
import '../SingIn/sign_in.dart';
import '../aboutJumlati/aboutJumlati.dart';
import '../favoritePage/Favorite.dart';
import '../shoppingcart/Check_order/check_order.dart';
import '../shoppingcart/shopping.dart';
import 'widgets/profile_item.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          shadowColor: AppColors.primaryColor,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerRight,
            child: Text("حسابي"),
          )),
        body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 80, child: _head()),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // color: Colors.black,
                      height: 700,
                      //width: 450,
                      child: Column(
                        children: [
                          // ProfileItem(
                          //   title: "بياناتي",
                          //   iconData: Iconsax.edit,
                          //   onTab: () {
                          //     Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) => SignIn(),
                          //       ),
                          //     );
                          //     print("test");
                          //   },
                          // ),


                          // ProfileItem(
                          //   title: "المفضلة",
                          //   iconData: Iconsax.lovely4,
                          //   onTab: () {
                          //     Navigator.of(context).push(
                          //       MaterialPageRoute(
                          //         builder: (context) => Favorite(),
                          //       ),
                          //     );
                          //     print("test");
                          //   },
                          // ),


                          if(BaseController.currentUser ==null)

                          ProfileItem(
                            title: "تسجيل الدخول",
                            iconData: Iconsax.logout4,
                            onTab: () {

                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignIn()));
                              Future.delayed(const Duration(milliseconds: 100),(){

                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                    const SignIn()), (Route<dynamic> route) => false);
                                // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Navigation()));

                              });


                            },
                          )
                          else
                            Column(children: [

                              Text('  مرحبا ${BaseController.currentUser!.username} ',style: AppStyles.primaryStyle(bold: true,color: AppColors.primaryColor,fontSize: 19),),
                              SizedBox(height: 30,),


                              ProfileItem(
                                title: " بياناتي",
                                iconData: Icons.person_outline_outlined,
                                onTab: () {

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ProfilePage(),
                                    ),
                                  );                            },
                              ),
                              ProfileItem(
                                title: "طلباتي",
                                iconData: Iconsax.document,
                                onTab: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MyOrder(),
                                    ),
                                  );
                                },
                              ),

                              ProfileItem(
                                title: "العناوين",
                                iconData: Iconsax.location4,
                                onTab: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Locations(),
                                    ),
                                  );



                                },
                              ),

                              ProfileItem(
                                title: "تسجيل الخروج",
                                iconData: Iconsax.logout4,
                                onTab: () async{


                                  showDialog(context: context, builder: (bc){
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: AlertDialog(title: Text('تسجيل الخروج'),

                                        content: SingleChildScrollView(
                                          child: Column(children: [

                                            Text("هل أنت متأكد أنك تريد تسجيل الخروج ؟"),


                                            SizedBox(height: 20,),


                                            Row(children: [

                                              Expanded(child: GestureDetector(

                                                onTap: ()async{

                                                  BaseController.currentUser=null;
                                                  await  BaseController.authBox.write("user", null);
                                                  setState(() {

                                                  });

                                                  Future.delayed(const Duration(milliseconds: 200),(){
                                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => SignIn()));

                                                  });

                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                  decoration: BoxDecoration(


                                                    color: AppColors.primaryColor,

                                                    borderRadius: BorderRadius.circular(10)

                                                  ),
                                                  child: Text('نعم',style: AppStyles.primaryStyle(color: AppColors.white),),
                                                ),
                                              )),

                                              SizedBox(width: 20,),
                                              Expanded(child: GestureDetector(

                                                onTap: ()async{


                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                                  decoration: BoxDecoration(


                                                      color: AppColors.primaryColor,

                                                      borderRadius: BorderRadius.circular(10)

                                                  ),
                                                  child: Text('لا',style: AppStyles.primaryStyle(color: AppColors.white),),
                                                ),
                                              )),



                                            ],)




                                          ],),
                                        ),

                                      ),
                                    );

                                  });



                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => SignIn(),
                                  //   ),
                                  // );

                                },
                              )


                            ],),
                          ProfileItem(
                            title: "من نحن",
                            iconData: Iconsax.people4 ,
                            onTab: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AboutJumlati(),
                                ),
                              );
                              print("test");
                            },
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        // Positioned(
        //   left: 37,
        //   child: Container(
        //     height: 77,
        //     width: 340,
        //     decoration: BoxDecoration(
        //       boxShadow: [
        //         BoxShadow(
        //           color: Color.fromRGBO(47, 125, 121, 0.3),
        //         ),
        //       ],
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(15),
        //     ),
        //     child: Column(
        //       children: [
        //         // SizedBox(height: 8),
        //         SizedBox(height: 12),
        //
        //         Padding(
        //           padding: const EdgeInsets.symmetric(horizontal: 10),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Row(
        //
        //                 children: [
        //                   Text(
        //                     '0',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: AppColors.primaryColor,
        //                     ),
        //                   ),
        //                   Text(
        //                     ':اجمالي طلباتي',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: AppColors.primaryColor,
        //                     ),
        //                   ),
        //                   CircleAvatar(
        //                     radius: 19,
        //                     backgroundColor: AppColors.backgroundicon,
        //                     child: Icon(
        //                       Iconsax.document,
        //                       color: AppColors.iconcolor,
        //                       size: 19,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //
        //               Row(
        //                 children: [
        //                   Text(
        //                     '0',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: AppColors.primaryColor,
        //                     ),
        //                   ),
        //                   Text(
        //                     ':طلباتي الحالية',
        //                     style: TextStyle(
        //                       fontWeight: FontWeight.w500,
        //                       fontSize: 16,
        //                       color: AppColors.primaryColor,
        //                     ),
        //                   ),
        //
        //                   CircleAvatar(
        //                     radius: 19,
        //                     backgroundColor: AppColors.backgroundicon,
        //                     child: Icon(
        //                       Iconsax.timer_start,
        //                       color: AppColors.iconcolor,
        //                       size: 19,
        //                     ),
        //                   ),
        //                   SizedBox(width: 7),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //
        //       ],
        //     ),
        //   ),
        // )
      ],
    );
  }
}
