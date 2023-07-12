import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';


import '../../shoppingcart/Check_order/check_order.dart';

import '../base_controller.dart';

class shopping extends StatefulWidget {
  const shopping({Key? key}) : super(key: key);

  @override
  State<shopping> createState() => _shoppingState();
}

class _shoppingState extends State<shopping> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F1),
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.primaryColor,
            elevation: 0,
            title: Align(
              alignment: Alignment.bottomRight,
              child: Text("الـسـلـة"),
            )),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 100, child: _head()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 700,
                              //width: 450,
                              child: Column(
                                children: [
                                  BaseController.cartItems.isNotEmpty
                                      ? Expanded(
                                          child: ListView.builder(
                                              itemCount: BaseController.cartItems.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                var quantity = 1;
                                                return Card(
                                                  elevation: 5,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                  ),
                                                  child: Container(
                                                    // color: AppColors.backgroundicon,
                                                    padding: EdgeInsets.only(
                                                        right: 16),
                                                    height: 110,
                                                    child: Row(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      children: [
                                                        Container(
                                                          height: 90,
                                                          width: 90,
                                                          child: Image.network(
                                                            BaseController
                                                                .cartItems[
                                                                    index]
                                                                .image??'',
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: 16,
                                                              right: 16,
                                                            ),
                                                            child: SizedBox(
                                                              height: 100,
                                                              child: Column(
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            BaseController.cartItems[index].title!,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w800,
                                                                              fontSize: 18,
                                                                              color: Colors.black87,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        IconButton(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.delete,
                                                                            color:Colors.red,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            BaseController.cartItems.removeAt(index);
                                                                            setState(() {});
                                                                          },
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            30,
                                                                        padding:
                                                                            EdgeInsets.only(left: 0.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.white,
                                                                                border: Border.all(width: 1, color: AppColors.iconcolor //                   <--- border width here
                                                                                    ),
                                                                                borderRadius: BorderRadius.circular(20),
                                                                              ),
                                                                              child: Row(
                                                                                children: [
                                                                                  IconButton(
                                                                                    onPressed: () {
                                                                                      if (BaseController.cartItems[index].quantity > 1) {
                                                                                        BaseController.cartItems[index].quantity -= 1;
                                                                                        setState(() {});
                                                                                      }
                                                                                    },
                                                                                    icon: const Icon(
                                                                                      Icons.remove,
                                                                                      color: Colors.black,
                                                                                      size: 15,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 4),
                                                                                  Text(
                                                                                    '${BaseController.cartItems[index].quantity}',
                                                                                    style: AppStyles.primaryStyle(
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                  const SizedBox(width: 4),
                                                                                  IconButton(
                                                                                    onPressed: () {
                                                                                      BaseController.cartItems[index].quantity += 1;
                                                                                      setState(() {});
                                                                                    },
                                                                                    icon: const Icon(
                                                                                      Icons.add,
                                                                                      color: Colors.black,
                                                                                      size: 15,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),

                                                                  Container(
                                                                    padding: EdgeInsets.only(left: 20),
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Text(
                                                                      BaseController
                                                                          .cartItems[index].price
                                                                          .toString()+
                                                                          ' ر.ي ',
                                                                      style: TextStyle(
                                                                        fontWeight: FontWeight.w800,
                                                                        color: AppColors.primaryColor,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              }))
                                      : Expanded(
                                          child: Container(
                                            height: 550.0,
                                            width: 420.0,
                                            color: Color(0xFFFAFAFA),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Iconsax.shopping_cart4,
                                                  color: Colors.grey,
                                                  size: 50,
                                                ),
                                                Text(
                                                  " السلة فارغة",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "لم تقم بإضافةاي عنصر حتى الان",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
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
              Container(
                decoration: BoxDecoration(
                    // color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0))),
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:BaseController.cartItems.isNotEmpty? AppColors.iconcolor:AppColors.disableColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ))),
                    onPressed: () {

                      if(BaseController.cartItems.isNotEmpty){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Check_order(),
                        ),
                      );}else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('السلة فارغة'),
                              behavior: SnackBarBehavior.floating,


                            ));
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 20,
                        ),
                        Text(
                          'التالي',
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(
                          width: 100,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                // color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 19,
                            backgroundColor: AppColors.backgroundicon,
                            child: Icon(
                              Iconsax.location4,
                              color: AppColors.iconcolor,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'العنوان',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(width: 7),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.iconcolor,
                            size: 19,
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
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
