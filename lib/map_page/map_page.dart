import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/data/repository/app_repository.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../base_controller.dart';
import '../const/app_colors.dart';
import '../models/address.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, this.address}) : super(key: key);
final Address? address;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {

  String mapKey="AIzaSyANbTjdAt6Dx06Vj3Ln-3pGKrN5atbPRog";

  TextEditingController addressCtrl=TextEditingController();
  late SimpleFontelicoProgressDialog _dialog ;




  BaseController baseController=BaseController();
  AppRepository appRepository=AppRepository();


  addEditAddress(double lat,double lng)async{
    var data={"address":addressCtrl.text,'latitude':lat,'longitude':lng};

    _dialog.show(message: 'الرجاء الانتظار ',type: SimpleFontelicoProgressDialogType.multilines,horizontal: true,width: 200);
var result=await    appRepository.addAddress(data,editId: widget.address !=null ?widget.address!.id :0);
    _dialog.hide();

if(result['status']==false){

  baseController.buildToastMsg(msg: result['message']);
}
else{

  baseController.buildToastMsg(msg: result['message'],success: true);

  Future.delayed(Duration(milliseconds: 100),(){
    Navigator.pop(context);
  });

}
print("*****************  $result");

  }

  OutlineInputBorder border=OutlineInputBorder(

    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: AppColors.primaryColor)
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.address !=null){
      addressCtrl.text=widget.address!.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    _dialog= SimpleFontelicoProgressDialog(context: context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('إضافة عنوان'),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Column(children: [

          SizedBox(height: 30,),

          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                    BorderSide(color: Colors.white))),
            child: TextField(
              textDirection: TextDirection.rtl,
              controller: addressCtrl,

              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  border: border,
                  enabledBorder: border,
                  prefixIcon: Icon(Icons.location_on),

                  hintText: " العنوان",
                  hintStyle:
                  TextStyle(color: Colors.grey[400])),
            ),
          ),


          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white,
                  width: 2.0,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(33),
                  topRight: Radius.circular(33),),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(33),
                  topRight: Radius.circular(33),),
                child: PlacePicker(
                  apiKey: mapKey,


                  selectedPlaceWidgetBuilder:
                      (context, selectedPlace, state, isSearchBarFocused) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      // controller.selectedLocationFunction(null);
                    });
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        GestureDetector(
                          onTap: (){

                            if(addressCtrl.text.isNotEmpty && selectedPlace !=null){


                              addEditAddress(selectedPlace.geometry!.location.lat, selectedPlace.geometry!.location.lng);
                              // print(addressCtrl.text);
                              // print(selectedPlace.geometry!.location.lat);
                              // print(selectedPlace.geometry!.location.lng);


                            }

                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20),


                              ),
                              color: AppColors.primaryColor,

                            ),
                            // width: 200,
                            height: 80,

                            alignment: Alignment.center,

                            child: Text( widget.address !=null?'تعديل': 'إضافة' ,style: AppStyles.primaryStyle(bold: true,fontSize: 16,color: Colors.white),),),
                        )

                      ],
                    );

                  },

                  automaticallyImplyAppBarLeading: false,
                  //موقع الرياض
                  initialPosition: widget.address !=null? LatLng(widget.address!.latitude,widget.address!.longitude): LatLng(15.32189021415384, 44.23065768856475),
                  useCurrentLocation: true,
                  // to move to current user location
                  selectInitialPosition: true,
                  // to select current user location and bring its data
                  enableMapTypeButton: true,
                  enableMyLocationButton: true,
                  resizeToAvoidBottomInset: true,
                  searchForInitialValue: false,

                  onPlacePicked: (p){
                    // print(p.name);
                    // print(p.adrAddress);
                    // print(p.formattedAddress);
                  },
                  onCameraMove: (p){

                    // print(p.target);
                  },


                ),
              ),
            ),
          )
        ],),
      ),
    );
  }
}
