
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../const/app_styles.dart';
import '../screen/bottomSheetDitals.dart';
import '../shoppingcart/Check_order/check_order.dart';
import 'MoreDitalsOrder/MoreDitalsOrder.dart';
class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);
  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.primaryColor,
            elevation: 0,
            title:Align(
              alignment: Alignment.topRight,
              child: Text(" طلباتي"),
            )

        ),
        body: SafeArea(
          child: Column(
            children: [
              BaseController.favItemsList.isNotEmpty?
              Expanded(
                  child: ListView.builder(
                      itemCount: BaseController.favItemsList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          elevation: 5,
                          margin: EdgeInsets.all(5),
                          child: Container(
                            decoration: BoxDecoration(
                              // color:AppColors. scaffoldColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )),
                            // color: AppColors.scaffoldColor,
                            padding: EdgeInsets.only(right: 16),
                            height: 110,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
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
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                  "رقم الطلب:",
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w800,
                                                      fontSize: 18,
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),



                                                // TextStyle(
                                                //   fontWeight: FontWeight.w800,
                                                //   color: AppColors.primaryColor,
                                                // ),

                                                Text(
                                                      'قيد المعالجة',
                                                  style: AppStyles.primaryStyle(
                                                    color: Colors.red,
                                                    fontSize: 17,
                                                    bold: true,

                                                  )


                                                ),
                                              ],
                                            ),

                                          ),

                                          Row(
                                            children: [
                                              Text(
                                                BaseController
                                                    .allProducts[index].price
                                                    .toString() +
                                                    ' ر.ي ',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),

                                            ],
                                          ),

                                          Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              TextButton(

                                                onPressed: (){Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) => MoreDitalsOrder(),
                                                  ),
                                                );},
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                    MaterialStateProperty.all(
                                                        AppColors.iconcolor),
                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(10),
                                                            side: BorderSide(color:Colors.amber))),
                                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                                        EdgeInsets.symmetric(
                                                            horizontal: 135,
                                                            vertical: 8))),
                                                child: Text(
                                                  'عرض التفاصيل',
                                                  style: (TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400)),
                                                ),
                                              ),


                                              // Spacer(),

                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        ;
                      })
              )

                  :Container(
                height: 638.0,
                width: 420.0,
                color:Color(0xFFFAFAFA),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Iconsax.document,color: Colors.grey,size: 50,),
                    Text(" لايوجد لديك طلبات",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    Text("لم تقم بأي طلب حتى الان",style: TextStyle(fontSize: 20,color: Colors.grey),),


                  ],
                ),
              )
            ],
          ),
        )


        ),

    );
  }

}
