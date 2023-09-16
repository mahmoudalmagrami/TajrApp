
import 'package:iconsax/iconsax.dart';
import 'package:flutter/material.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/data/repository/app_repository.dart';
import '../const/app_colors.dart';
import '../map_page/map_page.dart';
import '../models/address.dart';
class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);
  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddresses();

  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(),
        backgroundColor:const Color(0xFFFAFAFA),
        body:


      loading?const Center(child: CircularProgressIndicator()):  Container(
          child:
          addresses.isNotEmpty?
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        color:AppColors. primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0))),
                    height: 110.0,
                    width: 420.0,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [

                        BackButton(color: AppColors.white),
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

                  Expanded(
                    child: ListView.builder(itemCount: addresses.length,itemBuilder: (bc,index){
                      return GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MapPage(address: addresses[index],),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white

                          ),

                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '  ${addresses[index].address}',style: AppStyles.primaryStyle(bold: true,fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              )
              :
          Column(
            children: [

              header(),
              Container(
                height: 638.0,
                width: 420.0,
                color:const Color(0xFFFAFAFA),
                child: const Column(
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
        ),

        floatingActionButton: FloatingActionButton(onPressed: ()async{
        await  Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MapPage(),
            ),
          );

        getAddresses();

        },

        child: const Icon(Icons.add),
        ),
      ),
    );
  }

  header(){
    return             Container(
      decoration: const BoxDecoration(
          color:AppColors. primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      height: 110.0,
      width: 420.0,
      child: const Row(
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
    );

  }
}
