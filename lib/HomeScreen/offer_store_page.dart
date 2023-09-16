import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sell/HomeScreen/request_offer.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';
import 'package:sell/models/offer.dart';

import '../app_const/app_images.dart';
import '../base_controller.dart';
import '../data/local/local_db.dart';
import '../data/repository/app_repository.dart';
import '../models/item.dart';

class OfferStorePage extends StatefulWidget {
  const OfferStorePage({Key? key,required this.offer}) : super(key: key);

 final Offer offer;

  @override
  _OfferStorePageState createState() => _OfferStorePageState();
}

class _OfferStorePageState extends State<OfferStorePage> {

  AppRepository appRepository=AppRepository();
  bool isLoading=false;
  List<Item> currentProducts=[];

  getAllProducts()async{

    setState(() {
      isLoading=true;
    });
    currentProducts=await   appRepository.getOfferProducts(widget.offer.id!);



    // print(BaseController.allProducts.length);

    setState(() {
      isLoading=false;
    });

  }
  List<Item> favItemsList=[];
  getFavItems()async{

    favItemsList= await LocalDB.readItems(key: LocalDB.favKey);

    setState(() {

    });

  }

  bool checkFav(int id){


    return  favItemsList.where((element) => element.id==id).toList().isNotEmpty;


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    getFavItems();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تفاصيل العرض'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child:isLoading?const Center(child: CircularProgressIndicator()):
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [


                Container(
                  height: 200,
                  // width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: widget.offer.image!,
                      placeholder: (context, url) => ClipRRect(
                          borderRadius: BorderRadius.circular(20),

                          child: Image.asset(AppImages.logo)),
                      errorWidget: (context, url, error) => Image.asset(AppImages.logo),
                    ),
                  ),

                ),

                const SizedBox(height: 20,),

                Text(widget.offer.name!,style: AppStyles.primaryStyle(bold: true,fontSize: 25,color: AppColors.primaryColor),),

                const SizedBox(height: 5,),
                Text(widget.offer.details!,style: AppStyles.primaryStyle(bold: false,fontSize: 20,color: Colors.black),),
                const SizedBox(height: 20,),

                Row(
                  children: [
                    Text('سعر العرض:  ${widget.offer.price}',style: AppStyles.primaryStyle(bold: true,fontSize: 18,color: AppColors.primaryColor),),
                  ],
                ),
                const SizedBox(height: 10,),

                Row(
                  children: [
                    Text('منتجات العرض:',style: AppStyles.primaryStyle(bold: true,fontSize: 18,color: AppColors.primaryColor),),
                  ],
                ),


                widget.offer.products.isNotEmpty?
                ListView.builder(
                    itemCount: widget.offer.products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var item=widget.offer.products[index];
                      return Card(

                        shape: RoundedRectangleBorder(

                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: Container(
                          // color: AppColors.scaffoldColor,
                          padding: const EdgeInsets.only(right: 16),
                          height: 90,
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child:
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                    imageUrl: item.image,
                                    placeholder: (context, url) => ClipRRect(
                                        borderRadius: BorderRadius.circular(20),

                                        child: Image.asset(AppImages.logo)),
                                    errorWidget: (context, url, error) => Image.asset(AppImages.logo),
                                  ),
                                ),

                              ),

                              const SizedBox(width: 20,),
                              Expanded(
                                child: Text(
                                  item.name ,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }):const Center(

                  child: Column(children: [
                    SizedBox(height: 50,),

                    Icon(Icons.info,size: 60,),
                    SizedBox(height: 20,),
                    Text('No Products '),

                  ],),
                ),


                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){

                    ShowModalBottomSheetConfirm(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    // height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                    child: Text('طلب العرض',style: AppStyles.primaryStyle(bold: true,color: AppColors.white,fontSize: 20),),
                  ),
                ),

                const SizedBox(height: 20,),


              ],),
          ),
        ),
      ),
    );
  }
  void ShowModalBottomSheetConfirm(BuildContext context,) {
    showModalBottomSheet(
      context: context,
       isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          )),
      builder: (context) => RequestOffer(offerId: widget.offer.id!),
    );
  }

}
