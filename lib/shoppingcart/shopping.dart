import 'package:cached_network_image/cached_network_image.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/SingIn/sign_in.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/models/address.dart';


import '../../shoppingcart/Check_order/check_order.dart';

import '../app_const/app_images.dart';
// import '../base_controller.dart';
import '../data/local/local_db.dart';
import '../models/item.dart';

class shopping extends StatefulWidget {
  const shopping({Key? key}) : super(key: key);

  @override
  State<shopping> createState() => _shoppingState();
}

class _shoppingState extends State<shopping> {



  List<Item> cartItems=[];
  getCartItems()async{

    cartItems= await LocalDB.readItems(key: LocalDB.cartKey);

    setState(() {

    });

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCartItems();
  }
  @override
  Widget build(BuildContext context) {
    getCartItems();
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
                                  cartItems.isNotEmpty
                                      ? Expanded(
                                          child: ListView.builder(
                                              itemCount: cartItems.length,
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
                                                    height: 130,
                                                    child: Row(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            SizedBox(height: 10,),
                                                            Container(
                                                              height: 80,
                                                              width: 80,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20),

                                                              ),
                                                              child:
                                                              ClipRRect(
                                                                borderRadius: BorderRadius.circular(20),
                                                                child: CachedNetworkImage(
                                                                  imageUrl: cartItems[index].product!.image!,
                                                                  placeholder: (context, url) => ClipRRect(
                                                                      borderRadius: BorderRadius.circular(20),

                                                                      child: Image.asset(AppImages.logo)),
                                                                  errorWidget: (context, url, error) => Image.asset(AppImages.logo),
                                                                ),
                                                              ),

                                                            ),
                                                            SizedBox(height: 5,),

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
                                                                        // width: 100,
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
                                                                                if (cartItems[index].quantity > 1) {
                                                                                  cartItems[index].quantity -= 1;
                                                                                  LocalDB.updateItem(cartItems[index]);

                                                                                  setState(() {});
                                                                                }
                                                                              },
                                                                              icon: const Icon(
                                                                                Icons.remove,
                                                                                color: Colors.black,
                                                                                size: 15,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${cartItems[index].quantity}',
                                                                              style: AppStyles.primaryStyle(
                                                                                color: Colors.black,

                                                                              ),
                                                                            ),
                                                                            IconButton(
                                                                              onPressed: () {

                                                                                // print(cartItems[index].remainingQuantity);
                                                                                cartItems[index].quantity += 1;
                                                                                LocalDB.updateItem(cartItems[index]);

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

                                                          ],
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            // color: AppColors.primaryColor,
                                                            padding:
                                                                EdgeInsets.only(
                                                              top: 6,
                                                              right: 16,
                                                            ),
                                                            child: SizedBox(
                                                              height: 200,
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
                                                                            cartItems[index].product!.name!,
                                                                            maxLines: 2,
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
                                                                                LocalDB.removeItem(cartItems [index],);
                                                                            setState(() {});
                                                                          },
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),

                                                                  Container(
                                                                    padding: EdgeInsets.only(left: 20),
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Row(
                                                                      children: [
                                                                        Text("سعر الوحدة : "),
                                                                        Text(

                                                                          cartItems[index].unitPrice
                                                                              .toString()+
                                                                              ' ر.ي ',
                                                                          style: TextStyle(
                                                                            fontWeight: FontWeight.w800,
                                                                            color: AppColors.primaryColor,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    padding: EdgeInsets.only(left: 20),
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Row(
                                                                      children: [
                                                                        Text("السعر الفرعي  : "),
                                                                        Text(
                                                                            (double.parse(
                                                                              cartItems[index].unitPrice
                                                                              .toString())*
                                                                                cartItems[index].quantity) .toStringAsFixed(2)+
                                                                              ' ر.ي ',
                                                                          style: TextStyle(
                                                                            fontWeight: FontWeight.w800,
                                                                            color: AppColors.primaryColor,
                                                                          ),
                                                                        ),
                                                                      ],
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
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:cartItems.isNotEmpty? AppColors.iconcolor:AppColors.disableColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ))),
                    onPressed: () {

                      if(cartItems.isNotEmpty){

                        if(BaseController.currentUser !=null){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Check_order(cartItems: cartItems,),
                        ),
                      );

                        }
                        else{
                          BaseController().buildToastMsg(msg: 'يجب تسجيل الدخول');

                          Future.delayed((Duration(seconds: 1)),(){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          });

                        }


                      }else{
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
      ],
    );
  }
}
