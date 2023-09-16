
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/data/local/local_db.dart';
import 'package:sell/models/address.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../HomeScreen/home_screen.dart';
import '../../MyOrderPage/OrderPage.dart';
// import '../../base_controller.dart';
import '../../Navigation/navigation.dart';
import '../../const/app_styles.dart';
import '../../data/repository/app_repository.dart';
import '../../models/item.dart';
import '../../screen/BottomsheetDleviry.dart';
import '../shopping.dart';
import '../widgets/check_item.dart';



class Check_order extends StatefulWidget {
  const Check_order({Key? key,required this.cartItems,}) : super(key: key);
 final List<Item> cartItems;
  @override
  State<Check_order> createState() => _Check_orderState();
}

class _Check_orderState extends State<Check_order> {

   Address? selectedAddress;
   BaseController baseController=BaseController();
   late SimpleFontelicoProgressDialog _dialog ;

   AppRepository appRepository=AppRepository();
   List<Address> addresses=[];
   bool loading=false;
   getAddresses()async{

     setState(() {

       loading=true;
     });

     addresses=await appRepository.getAddress();

     setState(() {
       loading=false;

     });
   }


   confirmOrder()async{


     if(selectedType.isNotEmpty) {



       if(selectedAddress !=null) {
         var data = {
           "delivery_type": selectedType,

           "user_address_id": "${selectedAddress!.id}",

           "stores": widget.cartItems.map((e) =>
           {
             'store_id': e.id,
             'quantity': e.quantity
           }).toList()
         };


         print(data);


         _dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);

       var res=await  appRepository.addOrder(data);
_dialog.hide();
       if(res['status']==true){

         baseController.buildToastMsg(success: true,msg: 'تم إرسال طلبك بنجاح');

         LocalDB.removeAllItems();

         // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Navigation()));


         Future.delayed(const Duration(milliseconds: 100),(){

           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
               Navigation()), (Route<dynamic> route) => false);
           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Navigation()));

         });


       }
       // print(res);
       }
       else{
         baseController.buildToastMsg(msg: 'يجب تحديد  العنوان');

       }
     }
     else{

       baseController.buildToastMsg(msg: 'يجب تحديد نوع التوصيل');

     }

   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddresses();
  }


  Map<String,String> deliveryType={'delivery':"التوصيل مع الشحنة القادمة","byMyself":"بنفسي"};

   String selectedType='';

   selectType(String type){



     setState(() {
       selectedType=type;
     });

   }

   @override
  Widget build(BuildContext context) {
     _dialog= SimpleFontelicoProgressDialog(context: context);

     return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor:AppColors.scaffoldColor,
        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.primaryColor,
            elevation: 0,
            title:Align(
              alignment: Alignment.centerRight,
              child: Text("تأكيد الطلب"),
            )

        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: SizedBox(height: 60, child:_head()),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // color: Colors.black,
                              // height: 130,
                              //width: 450,
                                child: Column(
                                children: [

                                  Text(" التوصيل عبر : ",style: AppStyles.primaryStyle(bold: true,color: AppColors.primaryColor,fontSize: 20),),

                                  Row(children: [


                                    SizedBox(width: 10,),
                                    // if(selectedAddress !=null)
                                    Expanded(child: GestureDetector(
                                      onTap: (){
                                        selectType(deliveryType.keys.first);
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                              color: deliveryType.keys.first==selectedType ?AppColors.primaryColor:AppColors.white

                                          ),
                                        child: Text(" ${deliveryType.values.first}",textAlign: TextAlign.center,style: AppStyles.primaryStyle(bold: false,
                                              color: deliveryType.keys.first !=selectedType ?AppColors.primaryColor:AppColors.white

                                          ),),
                                      ),
                                    )),
                                    SizedBox(width: 10,),
                                    Expanded(child: GestureDetector(
                                      onTap: (){
                                        selectType(deliveryType.keys.last);
                                      },
                                      child: Container(
                                        height: 50,
                                          decoration: BoxDecoration(
                                              color: deliveryType.keys.last==selectedType ?AppColors.primaryColor:AppColors.white

                                          ),
                                          child: Text(" ${deliveryType.values.last}",textAlign: TextAlign.center,style: AppStyles.primaryStyle(bold: false,
                                              color: deliveryType.keys.last !=selectedType ?AppColors.primaryColor:AppColors.white

                                          ),)),
                                    )),



                                  ],),


                                  const SizedBox(height: 20),
                                  // CheckItem(title: "وقت التوصيل ",iconData: Iconsax.timer_start,onTab: (){ ShowModalBottomsheetDleviry(context); },),
                                  // CheckItem(title: "التوصيل الى",iconData: Iconsax.location4,onTab: (){  },),


                                  Row(children: [

                                    Expanded(child: Text(" التوصيل إلى : ",style: AppStyles.primaryStyle(bold: true,color: AppColors.primaryColor,fontSize: 20),)),

                                    // SizedBox(width: 10,),
                                    // if(selectedAddress !=null)
                                    // Expanded(child: Text(" ${selectedAddress!.address}",style: AppStyles.primaryStyle(bold: false,color: Colors.black.withOpacity(.7)),)),



                                  ],),
                                  const SizedBox(height: 10),

                                ],
                              ),

                            ),


                            loading?CircularProgressIndicator() : Container(
                              height: 40,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                  itemCount: addresses.length,
                                  itemBuilder: (bc,index){

                                return GestureDetector(
                                  onTap: (){
                                    selectedAddress=addresses[index];
                                    setState(() {

                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: addresses[index]==selectedAddress ?AppColors.primaryColor:AppColors.white
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(addresses[index].address,style: AppStyles.primaryStyle(

                                        color: addresses[index] !=selectedAddress ?AppColors.primaryColor:AppColors.white,
                                      bold: addresses[index] ==selectedAddress,
                                      fontSize: 16


                                    ),),
                                  ),
                                );

                              }),



                            ),
                            const SizedBox(height: 10),

                            Container(
                              child: Center(
                                  child: Column(children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Table(
                                        defaultColumnWidth: FixedColumnWidth(80.0),
                                        border: TableBorder.all(
                                            color: Colors.black,
                                            style: BorderStyle.solid,
                                            width: 2),



                                        children:table(),
                                      ),
                                    ),
                                  ])
                              ),
                            )
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
                        backgroundColor: AppColors.iconcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ))),

                    onPressed: () {

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' المجموع : ${getTotal().toStringAsFixed(2)} ر.ي',
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
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
                        backgroundColor: AppColors.iconcolor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ))),

                    onPressed: () {

                      confirmOrder();

                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'تأكيد الطلب',
                          style: TextStyle(fontSize: 25),
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

  List<TableRow> table(){

    List<TableRow> tableRows=[
      TableRow( children: [

        Column(children:[Text('اسم المنتج',textAlign: TextAlign.center, style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text('الكمية', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),

        Column(children:[Text('الاجمالي', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        // Column(children:[Text(' الفئة',style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
      ])
    ];
    tableRows.addAll(widget.cartItems.map((e) =>  TableRow(

        children: [
          Column(children:[Text('${e.product!.name}')]),
          Column(children:[Text('${e.quantity}')]),

          Column(children:[Text(' ${e.unitPrice*e.quantity}')]),
          // Column(children:[Text('${e.product!.productCategory}')]),
        ])).toList());

    return tableRows;


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

      ],
    );
  }


 double getTotal(){

    var p=0.0;

    for (var element in widget.cartItems) {
      p+=element.unitPrice*element.quantity;

    }
    return p;

 }
}

