import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../const/app_colors.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({Key? key,required this.title,required this.iconData,required this.onTab}) : super(key: key);

  final String title;
  final IconData iconData;
  final Function onTab;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              onTab();
            },
            child: Container(

              height: 70,
              // width: 340,
              margin: EdgeInsets.symmetric(horizontal: 0,vertical: 5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(47, 125, 121, 0.3),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size:20,
                              color: AppColors.primaryColor,
                            ),

                            SizedBox(width: 7),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color:AppColors.primaryColor,
                              ),
                            ),
                            SizedBox(width: 7),

                            CircleAvatar(

                              radius: 20,
                              backgroundColor: AppColors.backgroundicon,
                              child: Icon(
                                iconData,
                                color: AppColors.iconcolor,
                                size: 19,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
