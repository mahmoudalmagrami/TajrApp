import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
// import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/data/local/local_db.dart';

import '../app_const/app_images.dart';
import '../base_controller.dart';
import '../const/app_styles.dart';
import '../models/item.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {


  List<Item> favItemsList=[];
  getFavItems()async{

    favItemsList= await LocalDB.readItems(key: LocalDB.favKey);

    setState(() {

    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getFavItems();


  }

  @override
  Widget build(BuildContext context) {

    getFavItems();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F1),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color:AppColors. primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              height: 110.0,
              width: 420.0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        const Text("المفضلة",style:TextStyle(color: Colors.white,
                          fontSize: 30,fontWeight: FontWeight.bold,),)
                      ],
                    ),
                  ),
                ],
              ),
            ),


favItemsList.isNotEmpty?

       Expanded(
          child: ListView.builder(
          itemCount: favItemsList.length,
          // physics: const NeverScrollableScrollPhysics(),
          // shrinkWrap: true,
              padding: const EdgeInsets.only(bottom: 100),

              itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              elevation: 5,
              margin: const EdgeInsets.all(5),
              child: Container(
                decoration: const BoxDecoration(
                    // color:AppColors. scaffoldColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    )),
                // color: AppColors.scaffoldColor,
                padding: const EdgeInsets.only(right: 16),
                height: 110,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
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
                          imageUrl: favItemsList[index].product!.image!,
                          placeholder: (context, url) => ClipRRect(
                              borderRadius: BorderRadius.circular(20),

                              child: Image.asset(AppImages.logo)),
                          errorWidget: (context, url, error) => Image.asset(AppImages.logo),
                        ),
                      ),

                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
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
                                        favItemsList[index].product!.name!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),

                                      IconButton(
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {

                                        LocalDB.removeItem(favItemsList[index],key: LocalDB.favKey);

                                        setState(() {


                                        });
                                      },
                                    ),
                                  ],
                                ),

                              ),
                              Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  TextButton(
                                    onPressed: () =>
                                        ShowModalBottomSheetDitels(
                                            context,
                                                                                          favItemsList[index]),
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            AppColors.iconcolor),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10),
                                                side: const BorderSide(
                                                    color:AppColors.primaryColor))),
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                            const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 2))),
                                    child: const Text(
                                      'عرض الخيارات',
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${
                                        favItemsList[index].unitPrice} ر.ي ',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  // Spacer(),
                                  const SizedBox(
                                    width: 20,
                                  )
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
              color:const Color(0xFFFAFAFA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Iconsax.lovely5,color: Colors.grey,size: 50,),
                  const Text(" المفضلة فارغة",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  const Text("لم تقم بإضافةاي عنصر حتى الان",style: TextStyle(fontSize: 20,color: Colors.grey),),


                ],
              ),
            )
          ],
        ),
      ),
    );
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
        child:  Directionality(

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
                            child: Text(" ${item.product!.name}",style:TextStyle(color: Colors.black,
                              fontSize: 20,fontWeight: FontWeight.bold,),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [


                          Expanded(child: Text('${item.unit} ',style: AppStyles.primaryStyle(bold: true,fontSize: 16),))
                          ,
                          GestureDetector(

                              onTap: (){

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
                                    Text('${  item.unitPrice
                                        .toString() +
                                        ' ر.ي '} ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    // SizedBox(width: 20,),

                                  ],
                                ),
                              )),


                          SizedBox(width: 30,),

                          GestureDetector(

                              onTap: (){



                                item.quantity = 1;

                                LocalDB.saveItem(item,);
                                setState(() {

                                });


                                BaseController().buildToastMsg(
                                    msg: 'تمت الإضافة الى السلة',
                                    success: true);

                                Navigator.pop(context);


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
        ),
      ),
    );
  }

}
