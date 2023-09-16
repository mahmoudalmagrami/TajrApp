
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/data/repository/app_repository.dart';
import 'package:sell/models/order.dart';
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

  AppRepository appRepository=AppRepository();


  List<Order> orders=[];

  bool loading=false;
  getOrders()async{
print("start");
    setState(() {

      loading=true;
    });
    orders=await appRepository.getOrders();
    print(orders.length);
    setState(() {
      loading=false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrders();
  }

  Map<String,String> status={'under-review':"تحت المراجعة","user-accept":"مقبول","processing":"تحت المعالجة","canceled":"ملغي","delivered":"تم التسليم"};
  Map<String,String> orderType={'offer':"عرض","products":"منتجات"};

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
          child:loading ? Center(child: CircularProgressIndicator()): Column(
            children: [
              orders.isNotEmpty?
              Expanded(
                  child: ListView.builder(
                      itemCount: orders.length,

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
                            // height: 110,
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5,
                                      horizontal: 16,
                                    ),

                                    child: SizedBox(
                                      // height: 150,
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                "رقم الطلب:  ${orders[index].id}",
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
                                                    ' ${ status[ orders[index].status]}',
                                                style: AppStyles.primaryStyle(
                                                  color: Colors.red,
                                                  fontSize: 17,
                                                  bold: true,

                                                )


                                              ),
                                            ],
                                          ),

                                          Row(
                                            children: [
                                              Icon(Icons.monetization_on_rounded),
                                              Text(
                                                ' المبلغ الإجمالي : '+
                                                orders[index].totalAmount
                                                    .toString() +
                                                    ' ر.ي '

                                                ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),

                                            ],
                                          ),

                                          SizedBox(height: 12,),
                                          Row(
                                            children: [
                                              Icon(Icons.local_shipping),
                                              Text(
                                                '  سعر التوصيل : ${orders[index].deliveryAmount} ر.ي '
                                                ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 12,),

                                          Row(
                                            children: [
                                              Icon(Icons.local_offer),
                                              Text(
                                                '   نوع الطلب : ${ orderType[ orders[index].type]}  '
                                                ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  color: AppColors.primaryColor,
                                                ),
                                              ),

                                            ],
                                          ),
                                          SizedBox(height: 12,),
                                          Row(
                                            textDirection: TextDirection.rtl,
                                            children: [
                                              Expanded(
                                                child: TextButton(

                                                  onPressed: ()async{

                                               await     Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) => MoreDitalsOrder(orderStore: orders[index],),
                                                    ),
                                                  );

                                               getOrders();

                                                    },
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
                                                              horizontal: 15,
                                                              vertical: 8))),
                                                  child: Text(
                                                    'عرض التفاصيل',
                                                    style: (TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400)),
                                                  ),
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
