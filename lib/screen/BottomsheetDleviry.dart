
import 'package:flutter/material.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';

class BottomsheetDleviry extends StatefulWidget {
  const BottomsheetDleviry({Key? key}) : super(key: key);
  @override
  State<BottomsheetDleviry> createState() => _BottomsheetDleviryState();
}

class _BottomsheetDleviryState extends State<BottomsheetDleviry> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return  Directionality(

       textDirection: TextDirection.rtl,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -15,
            child: Container(
              width: 60,
              height: 7,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
          ),

          Column(
            children: [

              Text("أختيار وقت التوصيل",
                  style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor),
              ),
              Divider(),
              RadioListTile(
                title: Text("الطلب الان",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                value: "الطلب الان",
                groupValue: gender,

                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("استلمها بنفسي",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                value: "استلمها بنفسي",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("مع الشحنة القادمة",style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.primaryColor)),
                value: "مع الشحنة القادمة",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
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

                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => shopping(),
                      //   ),
                      // );
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
                          'موافق',
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
        ],
      ),
    );
  }

}


void ShowModalBottomsheetDleviry(BuildContext context) {
  showModalBottomSheet(
    context: context,
    //  isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        )),
    builder: (context) => SingleChildScrollView(
      // controller: scrollController,
      child:  BottomsheetDleviry(),
    ),
  );
}

