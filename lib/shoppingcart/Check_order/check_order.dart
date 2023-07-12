
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';

import '../../HomeScreen/home_screen.dart';
import '../../MyOrderPage/OrderPage.dart';
import '../../base_controller.dart';
import '../../const/app_styles.dart';
import '../../screen/BottomsheetDleviry.dart';
import '../shopping.dart';
import '../widgets/check_item.dart';



class Check_order extends StatefulWidget {
  const Check_order({Key? key}) : super(key: key);

  @override
  State<Check_order> createState() => _Check_orderState();
}

class _Check_orderState extends State<Check_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            height: 200,
                            //width: 450,
                              child: Column(
                              children: [
                                const SizedBox(height: 10),
                                CheckItem(title: "وقت التوصيل ",iconData: Iconsax.timer_start,onTab: (){ ShowModalBottomsheetDleviry(context); },),
                                CheckItem(title: "التوصيل الى",iconData: Iconsax.location4,onTab: (){  },),

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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => shopping(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        height: 20,
                      ),
                      Text(' المجموع : ${getTotal().toStringAsFixed(2)} ر.ي',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 70,
                        height: 20,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
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
                        'تأكيد الطلب',
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
    );

  }

  List<TableRow> table(){

    List<TableRow> tableRows=[
      TableRow( children: [
        Column(children:[Text('الاجمالي', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text('الكمية', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text(' الفئة',style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
        Column(children:[Text('اسم المنتج', style:AppStyles.primaryStyle(fontSize: 18,bold: true))]),
      ])
    ];
    tableRows.addAll(BaseController.cartItems.map((e) =>  TableRow(

        children: [

          Column(children:[Text(' ${e.price}')]),
          Column(children:[Text('${e.quantity}')]),
          Column(children:[Text('${e.category}')]),
          Column(children:[Text('${e.title}')]),
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

    for (var element in BaseController.cartItems) {
      p+=element.price!;

    }
    return p;

 }
}

