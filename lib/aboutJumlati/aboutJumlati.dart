import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';

class AboutJumlati extends StatelessWidget {
  const AboutJumlati({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,

        title: Align(
          alignment: Alignment.centerRight,
          child: Text("من نحن"),
        )
      ),
      body:
         Column(
          children: [
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 150),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle
              ),
              height: 100,
              width: 110,
              child:CircleAvatar(
                backgroundImage: AssetImage('assets/images/Jumlati.png'),
                radius: 220,
              )


            ),
            SizedBox(height: 50),
            Container(
             child: Column(
               children: [

                 Text("زحمه الشوارع ، طوابير المحاسبة ، بعد المحلات ، اسعار مرتفعة ",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),
                 SizedBox(height: 5,),
                 Text("كل هذه المشاكل يعاني منها تجار التجزئة",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),



                 Text("تطبيق جملتي متجرك يزيح عنك كل هذة المشاكل واصبح",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),
                 Text("بأمكانك كتاجر تجزئة الطلب عبر التطبيق وانت مكانك",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),
                 Text("بأسعار منافسة وخدمة توصيل بسعر رمزي جدا",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),
                 Text("والدفع عند استلام بضاعتك",style:AppStyles.primaryStyle(color: AppColors.primaryColor,fontSize: 18,bold: true)),

               ],
             ), 
            ),
            SizedBox(height: 250,),
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


          ],
        ),
      );

  }
}
