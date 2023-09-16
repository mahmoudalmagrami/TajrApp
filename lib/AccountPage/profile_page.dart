import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sell/AccountPage/widgets/profile_item.dart';
import 'package:sell/base_controller.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/models/app_user.dart';
import 'package:iconsax/iconsax.dart';

import '../SingIn/sign_in.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);
final AppUser? user=BaseController.currentUser;
  // final GetStorage authBox=GetStorage();

  @override
  Widget build(BuildContext context) {

    var userData=BaseController. authBox.read('user');

    print("************************* userData  $userData");
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: user !=null? Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
            // SizedBox(height: 50,),

            Row(
              children: [
                Icon(Icons.person,color: AppColors.primaryColor,),
                SizedBox(width: 20,),
                Text("${user!.username}",style: AppStyles.primaryStyle(bold: true,fontSize: 18),),
              ],
            ),
            SizedBox(height: 20,),

            Row(
              children: [
                Icon(Icons.email,color: AppColors.primaryColor,),
                SizedBox(width: 20,),

                Text("${user!.email}",style: AppStyles.primaryStyle(bold: false,fontSize: 15),),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.phone,color: AppColors.primaryColor,),
                SizedBox(width: 20,),
                Text("${user!.phoneNumber}",style: AppStyles.primaryStyle(bold: false,fontSize: 15),),
              ],
            ),

            SizedBox(height: 50,),



          ],),
        ):Center(),
      ),
    );
  }
}
