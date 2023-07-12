import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';

import '../screen/bottomSheetDitals.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF6F6F1),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color:AppColors. primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))),
              height: 110.0,
              width: 420.0,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
                    child: Row(
                      children: [
                        Text("المفضلة",style:TextStyle(color: Colors.white,
                          fontSize: 30,fontWeight: FontWeight.bold,),)
                      ],
                    ),
                  ),
                ],
              ),
            ),


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
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        BaseController.favItemsList[index].image,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        BaseController.favItemsList[index].title!,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),

                                    BaseController.favItemsList[index].fav == 0
                                        ? Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: IconButton(
                                        icon: Icon(
                                            Icons.favorite_border),
                                        color: Colors.red,
                                        onPressed: () {

                                          setState(() {
                                            BaseController.favItemsList[index]
                                                .fav++;
                                          });
                                        },
                                      ),
                                    )
                                        : IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {

                                        BaseController.favItemsList[index]
                                            .fav--;
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
                                            BaseController
                                                .favItemsList[index]),
                                    style: ButtonStyle(
                                        backgroundColor:
                                        MaterialStateProperty.all(
                                            AppColors.iconcolor),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10),
                                                side: BorderSide(
                                                    color:Colors.amber))),
                                        padding: MaterialStateProperty.all<EdgeInsets>(
                                            EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 2))),
                                    child: Text(
                                      'عرض الخيارات',
                                      style: (TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    BaseController
                                        .favItemsList[index].price
                                        .toString() +
                                        ' ر.ي ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  // Spacer(),
                                  SizedBox(
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
              color:Color(0xFFFAFAFA),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Iconsax.lovely5,color: Colors.grey,size: 50,),
                  Text(" المفضلة فارغة",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("لم تقم بإضافةاي عنصر حتى الان",style: TextStyle(fontSize: 20,color: Colors.grey),),


                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
