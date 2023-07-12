import 'package:flutter/material.dart';
import 'package:sell/const/app_styles.dart';

import '../../const/app_colors.dart';

class MoreDitalsOrder extends StatefulWidget {
  const MoreDitalsOrder({Key? key}) : super(key: key);

  @override
  State<MoreDitalsOrder> createState() => _MoreDitalsOrderState();
}

class _MoreDitalsOrderState extends State<MoreDitalsOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 210,
                child: Padding(
                    padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Align(
                        child:Text(": رقم الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                        alignment: Alignment.topRight,


                      ),
                      SizedBox(height: 20,),
                      Align(child:Text(": حالة الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),alignment: Alignment.topRight,

                      ),
                      SizedBox(height: 20,),
                      Align(child:Text(": وقت الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),alignment: Alignment.topRight,

                      ),
                      Align(child:Text(": سعر التوصيل",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),alignment: Alignment.topRight,

                      ),
                    ],

                  ),


                ),








            ),
          ),
         Container(
           padding: EdgeInsets.all(20.0),
           child: Column(
             children: [
               Align(
                 child:Text(": تفاصيل الطلب",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                 alignment: Alignment.centerRight,
               )

             ],
           ),

         ),
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
                      children: [
                        TableRow( children: [
                          Column(children:[Text('الاجمالي', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
                          Column(children:[Text('الكمية', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
                          Column(children:[Text('نوع الوحدة',style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
                          Column(children:[Text('اسم المنتج', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
                        ]),


                        TableRow( children: [
                          Column(children:[Text('')]),
                          Column(children:[Text(' ')]),
                          Column(children:[Text('')]),
                          Column(children:[Text('')]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('')]),
                          Column(children:[Text(' ')]),
                          Column(children:[Text('')]),
                          Column(children:[Text('')]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('')]),
                          Column(children:[Text(' ')]),
                          Column(children:[Text('')]),
                          Column(children:[Text('')]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('')]),
                          Column(children:[Text(' ')]),
                          Column(children:[Text('')]),
                          Column(children:[Text('')]),
                        ]),





                      ],
                    ),
                  ),
                ])
            ),
          )


        ],


      ),


    );
  }
}
