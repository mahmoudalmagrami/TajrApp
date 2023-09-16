import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sell/models/item.dart';
import 'package:sell/const/app_styles.dart';
// import 'package:sell/data/models/product.dart';

import '../Navigation/navigation.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../data/local/local_db.dart';

class BottomsheetDitels extends StatefulWidget {
  const BottomsheetDitels({Key? key,required this.item}) : super(key: key);
final  Item item;
  @override
  State<BottomsheetDitels> createState() => _BottomsheetDitelsState();

}
int quantity = 1;
class _BottomsheetDitelsState extends State<BottomsheetDitels> {
  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: Column(
          children: [

            Padding(

              padding: EdgeInsets.only(top: 25.0, right: 20.0, left: 15.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(" ${widget.item.product!.name}",style:TextStyle(color: Colors.black,
                          fontSize: 20,fontWeight: FontWeight.bold,),),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Row(
            //    mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //    Padding(padding: EdgeInsets.only(left: 20.0),
            //      child: Row(
            //        children: [
            //          Material(
            //            color:AppColors. primaryColor,
            //            borderRadius: BorderRadius.circular(30),
            //            child: Row(
            //              children: [
            //                IconButton(
            //                  onPressed: () {
            //                    if (quantity > 1) {
            //                      quantity -= 1;
            //                      setState(() {});
            //                    }
            //                  },
            //                  icon: const Icon(Icons.remove, color: Colors.white),
            //                ),
            //                const SizedBox(width: 4),
            //                Text(
            //                  '$quantity',
            //                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //                    color: Colors.white,
            //                  ),
            //                ),
            //                const SizedBox(width: 4),
            //                IconButton(
            //                  onPressed: () {
            //                    quantity += 1;
            //                    setState(() {});
            //                  },
            //                  icon: const Icon(Icons.add, color: Colors.white),
            //                ),
            //              ],
            //            ),
            //          ),
            //        ],
            //      ),
            //
            //
            //    ),
            //
            //   ],
            // ),
        SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [


                      Expanded(child: Text('${widget.item.unit} ',style: AppStyles.primaryStyle(bold: true,fontSize: 16),))
,
                      GestureDetector(

                          onTap: (){
                            if(!BaseController.cartItems.contains(widget.item)) {
                              BaseController.cartItems.add(widget.item);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                            decoration: BoxDecoration(

                                color: AppColors.iconcolor,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${  widget.item.unitPrice
                                .toString() +
                                ' ر.ي '} ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                // SizedBox(width: 20,),

                              ],
                            ),
                          )),


                      SizedBox(width: 30,),

                      GestureDetector(

                          onTap: (){



                            if(!BaseController.cartItems.contains(widget.item)) {

                              LocalDB.saveItem(widget.item);


                              BaseController.cartItems.add(widget.item);


                              BaseController().buildToastMsg(msg: 'تمت الإضافة الى السلة',success: true);

                              Navigator.pop(context);

                            }
                          },

                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                           // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                            decoration: BoxDecoration(

                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('اضافه الى السلة ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                // SizedBox(width: 20,),

                              ],
                            ),
                          )),


                    ],
                  ),
                  DottedLine(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    lineLength: double.infinity,
                    lineThickness: 1.0,
                    dashLength: 4.0,
                    dashColor: Colors.black,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,

                  )

                ],
              ),
            )





            , SizedBox(
              height: 20,
            ),
            const Center(

            ),
            const SizedBox(
              height: 30,
            ),

            const SizedBox(
              height: 14,
            ),

          ]),
    );
  }
}

void ShowModalBottomSheetDitels(BuildContext context,Item item) {
  showModalBottomSheet(
    context: context,
    //  isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        )),
    builder: (context) => SingleChildScrollView(
      // controller: scrollController,
      child:  BottomsheetDitels(item: item,),
    ),
  );
}
