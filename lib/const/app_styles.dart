import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';


class  AppStyles{


    AppStyles._();


static TextStyle primaryStyle({Color color=AppColors.primaryColor,bool bold=false,double fontSize=14,double height=1.2}){

         return TextStyle(color: color,fontSize: fontSize,fontWeight: bold ? FontWeight.bold:FontWeight.normal);
}



}