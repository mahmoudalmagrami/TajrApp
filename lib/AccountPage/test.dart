import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';

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
              child: SizedBox(height: 100, child: _head()),
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
                          ProfileItem(
                            title: "بياناتي",
                            iconData: Iconsax.edit,
                            onTab: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Sign_in(),
                                ),
                              );
                              print("test");
                            },
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
                            title: "المفضلة",
                            iconData: Iconsax.lovely4,
                            onTab: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Favorite(),
                                ),
                              );
                              print("test");
                            },
                          ),
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
                          ProfileItem(
                            title: "تسجيل الخروج",
                            iconData: Iconsax.logout4,
                            onTab: () {

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
                    padding: const EdgeInsets.only(top: 20, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          left: 37,
          child: Container(
            height: 77,
            width: 340,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(47, 125, 121, 0.3),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                // SizedBox(height: 8),
                SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            ':اجمالي طلباتي',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: AppColors.backgroundicon,
                            child: Icon(
                              Iconsax.document,
                              color: AppColors.iconcolor,
                              size: 19,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text(
                            ':طلباتي الحالية',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),

                          CircleAvatar(
                            radius: 19,
                            backgroundColor: AppColors.backgroundicon,
                            child: Icon(
                              Iconsax.timer_start,
                              color: AppColors.iconcolor,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }
}
