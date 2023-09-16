import 'package:flutter/material.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/data/repository/app_repository.dart';
import 'package:sell/models/order.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../const/app_colors.dart';

class MoreDitalsOrder extends StatefulWidget {
  const MoreDitalsOrder({Key? key,required this.orderStore}) : super(key: key);
  final Order orderStore;

  @override
  State<MoreDitalsOrder> createState() => _MoreDitalsOrderState();
}

class _MoreDitalsOrderState extends State<MoreDitalsOrder> {
  Map<String,String> deliveryType={'delivery':" التوصيل مع الشحنه القادمة","byMyself":"بنفسي"};
  Map<String,String> status={'under-review':"تحت المراجعة","user-accept":"مقبول","processing":"تحت المعالجة","canceled":"ملغي","delivered":"تم التسليم"};
  Map<String,String> orderType={'offer':"عرض","products":"منتجات"};

 final AppRepository appRepository=AppRepository();

  late SimpleFontelicoProgressDialog _dialog ;

 confirmOrder(bool status)async{

   _dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);

   var res=await appRepository.confirmOrder(widget.orderStore.id!, status);
_dialog.hide();

   if(res['status']==true){

     Future.delayed(const Duration(milliseconds: 200),(){
       Navigator.pop(context);

     });
   }
   else{

     BaseController().buildToastMsg(msg:  'فشل تغيير الحالة حاول مرة أخرى أو اتصل بالدعم الفني');

   }



 }


  @override
  Widget build(BuildContext context) {
    _dialog= SimpleFontelicoProgressDialog(context: context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,

        appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            shadowColor: AppColors.primaryColor,
            elevation: 0,
            title:Align(
              alignment: Alignment.centerRight,
              child: Text("تفاصيل الطلب"),
            )

        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),

              ),
              // color: Colors.red,
              child: SizedBox(
                width: 450,
                  // height: 210,
                  child: Padding(
                      padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child:Text(" رقم الطلب : ${widget.orderStore.id} ",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),


                        ),
                        SizedBox(height: 20,),
                        Align(alignment: Alignment.topRight,child:Text("حالة الطلب : ${ status[ widget.orderStore.status] }",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),

                        ),
                        SizedBox(height: 20,),
                        // Align(child:Text(": وقت الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),alignment: Alignment.topRight,
                        //
                        // ),
                        Align(alignment: Alignment.topRight,child:Text(" نوع التوصيل :${ deliveryType[ widget.orderStore.deliveryType]}",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),),

                        SizedBox(height: 20,),

                        Align(alignment: Alignment.topRight,child:Text(" سعر التوصيل :  ${  widget.orderStore.deliveryAmount}  ر.ي ",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),),

                        SizedBox(height: 20,),
                        // Align(child:Text(": وقت الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),alignment: Alignment.topRight,
                        //
                        // ),
                        Align(alignment: Alignment.topRight,child:Text(" نوع الطلب :${ orderType[ widget.orderStore.type]}",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),),


                        SizedBox(height: 20,),



                      ],

                    ),


                  ),








              ),
            ),

            if(widget.orderStore.type !='offer')

              Container(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Align(
                   alignment: Alignment.centerRight,
                   child:Text(" تفاصيل الطلب:",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                 )

               ],
             ),

           ),

            if(widget.orderStore.type !='offer')
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          defaultColumnWidth: FixedColumnWidth(80.0),
                          border: TableBorder.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 2),
                          children:table(),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),


            if(widget.orderStore.status =='user-accept'  &&widget.orderStore.type !='offer')
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [

                Expanded(child: GestureDetector(
                  onTap: (){

                    confirmOrder(true);
                  },
                  child: Container(

                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),color: AppColors.primaryColor

                  ),

                  child: Text('موافقة',textAlign: TextAlign.center,style: AppStyles.primaryStyle(color: AppColors.white),),
                  ),
                ),),
                SizedBox(width: 20,),


                Expanded(child: GestureDetector(
                  onTap: (){
                    confirmOrder(false);

                  },
                  child: Container(


                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),color: Colors.red[800]

                  ),

                  child: Text('الغاء',textAlign: TextAlign.center,style: AppStyles.primaryStyle(color: AppColors.white),),
                  ),
                ),),

              ],),
            ),

            SizedBox(height: 30,),



          ],


        ),


      ),
    );
  }

  List<TableRow> table(){

    List<TableRow> tableRows=[
      TableRow( children: [

        Column(children:[Text('اسم المنتج',textAlign: TextAlign.center, style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text('الكمية', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text('الوحدة', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),

        Column(children:[Text('الاجمالي', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text(' الفئة',style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text(' ملاحظات ',style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
      ])
    ];
    tableRows.addAll(widget.orderStore.products!.map((e) =>  TableRow(


        children: [
          cellItem('${e.name}'),
          cellItem('${e.quantity}'),
          cellItem('${e.unit}'),

          cellItem(' ${e.price }'),
          cellItem('${e.category!.name}'),
          cellItem( e.remainingQuantity==e.quantity? 'لا توجد ملاحظات' : ' الكمية المتبقية  ${e.remainingQuantity}'),
        ])).toList());

    return tableRows;


  }


  cellItem(String data){

   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [

       Text(' $data ')

     ],),
   );

  }

}
