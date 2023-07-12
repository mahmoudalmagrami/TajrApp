
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import '../const/app_colors.dart';
class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);
  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Padding(
                  padding: EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
                  child: Row(
                    children: [
                      Text("عناويني",style:TextStyle(color: Colors.white,
                        fontSize: 30,fontWeight: FontWeight.bold,),)
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            height: 638.0,
            width: 420.0,
            color:Color(0xFFFAFAFA),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Icon(Iconsax.location4,color: Colors.grey,size: 50,),
                Text("قائمة عناويني فارغة",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("ليس لديك اي عنوان حتى الان",style: TextStyle(fontSize: 20,color: Colors.grey),),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
