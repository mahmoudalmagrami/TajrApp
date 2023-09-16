import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutJumlati extends StatelessWidget {
  const AboutJumlati({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        appBar: AppBar(

          elevation: 0.0,
          backgroundColor: AppColors.primaryColor,

          title: Align(
            alignment: Alignment.centerRight,
            child: Text("من نحن"),
          )
        ),
        body:
           SingleChildScrollView(
             padding: EdgeInsets.symmetric(horizontal: 20),
             child: Column(
              children: [
                SizedBox(height: 30,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 150),
                  decoration: BoxDecoration(
                      // color: Colors.orange,
                      shape: BoxShape.circle
                  ),
                  height: 100,
                  width: 110,
                  child:SvgPicture.asset(
                    'assets/logos/logo.svg',
                  ),


                ),
                SizedBox(height: 50),
                Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [




                     Text(""
                         "زحمه الشوارع ، طوابير المحاسبة ، بعد المحلات ، اسعار مرتفعة"
                         ""
                         "   كل هذه المشاكل يعاني منها تجار التجزئة"
                         "  \n"
                         "بأسعار منافسة وخدمة توصيل بسعر رمزي جدا تطبيق جملتي متجرك يزيح عنك كل هذة المشاكل واصبح بأمكانك كتاجر تجزئة الطلب عبر التطبيق وانت مكانك والدفع عند استلام بضاعتك",textAlign: TextAlign.center,style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),

                   ],
                 ),
                ),
                SizedBox(height: 100,),
                Container(

                 child: Column(
                  children: [
                   Text("الاصدار:0.1",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor),)

                  ],
                 ),
                ),
                Container(
                 child: Column(
                  children: [
                   Text("FAMSK:تصميم وتطوير",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor),)
                  ],
                 ),
                ),
                SizedBox(height: 50),


              ],
          ),
           ),
        ),
    );

  }
}
