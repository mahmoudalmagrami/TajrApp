import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../base_controller.dart';
import '../const/app_colors.dart';

class shoppingGG extends StatefulWidget {
  const shoppingGG({Key? key}) : super(key: key);

  @override
  State<shoppingGG> createState() => _shoppingGGState();
}

class _shoppingGGState extends State<shoppingGG> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
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
                    Text(
                      "السله",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        BaseController.cartItems.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    itemCount: BaseController.cartItems.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(

                        elevation: 10,
                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: EdgeInsets.all(5),
                        child: Container(
                          // color: AppColors.backgroundicon,
                          padding: EdgeInsets.only(right: 16),
                          height: 110,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                child: Image.network(
                                  BaseController.cartItems[index].image??'',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                    right: 16,
                                  ),
                                  child: SizedBox(
                                    height: 100,
                                    child: Column(
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  BaseController.cartItems[index].title!,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 18,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                                   IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                ),
                                                onPressed: () {
                                                  BaseController.cartItems
                                                      .removeAt(index);
                                                  setState(() {});
                                                },
                                              )

                                            ],
                                          ),
                                        ),
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
            : Container(

                height: 550.0,
                width: 420.0,
                color: Color(0xFFFAFAFA),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Iconsax.shopping_cart4,
                      color: Colors.grey,
                      size: 50,
                    ),
                    Text(
                      " السلة فارغة",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "لم تقم بإضافةاي عنصر حتى الان",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ],
                ),
              )
        ,
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
                  backgroundColor: AppColors.iconcolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(20),
                      )
                  )
              ),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  SizedBox(
                    width:100,
                    height: 20,
                  ),
                  Text('التالي',style: TextStyle(fontSize:25),),

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
    );
  }
}
