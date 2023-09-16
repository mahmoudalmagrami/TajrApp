import 'package:flutter/material.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../Navigation/navigation.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../const/app_styles.dart';
import '../data/repository/app_repository.dart';
import '../models/address.dart';

class RequestOffer extends StatefulWidget {
  const RequestOffer({Key? key,required this.offerId}) : super(key: key);

  final int offerId;
  @override
  _RequestOfferState createState() => _RequestOfferState();
}

class _RequestOfferState extends State<RequestOffer> {
  Address? selectedAddress;
  BaseController baseController=BaseController();
  late SimpleFontelicoProgressDialog _dialog ;

  AppRepository appRepository=AppRepository();
  List<Address> addresses=[];
  bool loading=false;
  getAddresses()async{

    setState(() {

      loading=true;
    });

    addresses=await appRepository.getAddress();

    setState(() {
      loading=false;

    });
  }


  confirmOrder()async{


    if(selectedType.isNotEmpty) {



      if(selectedAddress !=null) {
        var data = {
          "delivery_type": selectedType,

          "user_address_id": "${selectedAddress!.id}",
          "type":"offer",
          "offer_id": widget.offerId




        };


        print(data);


        _dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);

        var res=await  appRepository.addOrder(data);
        _dialog.hide();
        if(res['status']==true){

          baseController.buildToastMsg(success: true,msg: 'تم إرسال طلبك بنجاح');




          Future.delayed(const Duration(milliseconds: 100),(){

            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                Navigation()), (Route<dynamic> route) => false);
            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Navigation()));

          });


        }
        print(res);
      }
      else{
        baseController.buildToastMsg(msg: 'يجب تحديد  العنوان');

      }
    }
    else{

      baseController.buildToastMsg(msg: 'يجب تحديد نوع التوصيل');

    }

  }
  Map<String,String> deliveryType={'delivery':"التوصيل مع الشحنة القادمة","byMyself":"بنفسي"};

  String selectedType='';

  selectType(String type){



    setState(() {
      selectedType=type;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddresses();

  }

  @override
  Widget build(BuildContext context) {
    _dialog= SimpleFontelicoProgressDialog(context: context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),

            Container(
              // color: Colors.black,
              // height: 130,
              //width: 450,
              child: Column(
                children: [

                  Text(" التوصيل عبر : ",style: AppStyles.primaryStyle(bold: true,color: AppColors.primaryColor,fontSize: 20),),

                  Row(children: [


                    SizedBox(width: 10,),
                    // if(selectedAddress !=null)
                    Expanded(child: GestureDetector(
                      onTap: (){
                        selectType(deliveryType.keys.first);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: deliveryType.keys.first==selectedType ?AppColors.primaryColor:AppColors.white

                        ),
                        child: Text(" ${deliveryType.values.first}",textAlign: TextAlign.center,style: AppStyles.primaryStyle(bold: false,
                            color: deliveryType.keys.first !=selectedType ?AppColors.primaryColor:AppColors.white

                        ),),
                      ),
                    )),
                    SizedBox(width: 10,),
                    Expanded(child: GestureDetector(
                      onTap: (){
                        selectType(deliveryType.keys.last);
                      },
                      child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: deliveryType.keys.last==selectedType ?AppColors.primaryColor:AppColors.white

                          ),
                          child: Text(" ${deliveryType.values.last}",textAlign: TextAlign.center,style: AppStyles.primaryStyle(bold: false,
                              color: deliveryType.keys.last !=selectedType ?AppColors.primaryColor:AppColors.white

                          ),)),
                    )),



                  ],),


                  const SizedBox(height: 20),
                  // CheckItem(title: "وقت التوصيل ",iconData: Iconsax.timer_start,onTab: (){ ShowModalBottomsheetDleviry(context); },),
                  // CheckItem(title: "التوصيل الى",iconData: Iconsax.location4,onTab: (){  },),


                  Row(children: [

                    Expanded(child: Text(" التوصيل إلى : ",style: AppStyles.primaryStyle(bold: true,color: AppColors.primaryColor,fontSize: 20),)),

                    // SizedBox(width: 10,),
                    // if(selectedAddress !=null)
                    // Expanded(child: Text(" ${selectedAddress!.address}",style: AppStyles.primaryStyle(bold: false,color: Colors.black.withOpacity(.7)),)),



                  ],),
                  const SizedBox(height: 10),

                ],
              ),

            ),


            loading?CircularProgressIndicator() : Container(
              height: 40,

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: addresses.length,
                  itemBuilder: (bc,index){

                    return GestureDetector(
                      onTap: (){
                        selectedAddress=addresses[index];
                        setState(() {

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: addresses[index]==selectedAddress ?AppColors.primaryColor:AppColors.white
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(addresses[index].address,style: AppStyles.primaryStyle(

                            color: addresses[index] !=selectedAddress ?AppColors.primaryColor:AppColors.white,
                            bold: addresses[index] ==selectedAddress,
                            fontSize: 16


                        ),),
                      ),
                    );

                  }),



            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                // color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0))),
              margin: EdgeInsets.symmetric(vertical: 20),
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

                    confirmOrder();

                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تأكيد الطلب',
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
