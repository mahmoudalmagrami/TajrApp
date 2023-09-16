import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:sell/app_const/app_images.dart';
import 'package:sell/const/app_strings.dart';
import 'package:sell/data/api/app_api.dart';
import 'package:sell/data/local/local_db.dart';
import 'package:sell/screen/bottomSheetDitals.dart';
import 'package:iconsax/iconsax.dart';
import '../const/app_styles.dart';
import '../models/category.dart';
import '../models/item.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../data/models/product.dart';
import '../data/repository/app_repository.dart';
import '../models/offer.dart';
import '../screen/slider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  AppRepository appRepository=AppRepository();
  bool isLoading=false;
  List<Item> currentProducts=[];

  List<Category> categories=[];
  List<Offer> offers=[];

  Category selectedCategory=Category();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllProducts();
    getFavItems();
  }
  getAllProducts()async{

    setState(() {
      isLoading=true;
    });
  BaseController.allProducts=await   appRepository.getProducts();
    // currentProducts=BaseController.allProducts;
  categories=await appRepository.getCategories();
  offers=await appRepository.getOffers();

  if(categories.isNotEmpty) {
    selectedCategory = categories.first;
    updateCategory(selectedCategory);
  }

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
  Widget build(BuildContext context) {
getFavItems();
    return Scaffold(
      backgroundColor:AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('جملتي',style: AppStyles.primaryStyle(bold: true,fontSize: 20,color: AppColors.white),),

            SizedBox(width: 10,),
            SvgPicture.asset(
              'assets/logos/logo.svg',
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size(3, 60),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(7),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: controller,
                    onFieldSubmitted: (covariant) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.search_favorite),
                      hintText: "ابحـث عن الاشياء المفضلة لديك",
                      hintStyle: TextStyle(fontSize: 15,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        //height: 620,
        child: SingleChildScrollView(

          child: RefreshIndicator(
            onRefresh: ()=>getAllProducts(),

            child: Column(
              children: [
               isLoading?Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(height: 100,),
                   Center(child: CircularProgressIndicator()),
                 ],
               ): Column(
                  children: [

                 offers.isNotEmpty?   SizedBox(height: 250, child: EnlargeStrategyDemo(offers: offers,))

                    :              ClipRRect(
        borderRadius: BorderRadius.circular(20),
    child: CachedNetworkImage(
    imageUrl:'',width: 1000,
    placeholder: (context, url) => ClipRRect(
    borderRadius: BorderRadius.circular(20),

    child: Image.asset(AppImages.logo,width: 1000,)),
    errorWidget: (context, url, error) => Image.asset(AppImages.logo,width: 1000,),
    ),
    ),



                    Container(
                      height: 50,
                      color: Colors.white.withOpacity(0.7),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: categories.map((e) =>_singleItem(e) ).toList(),
                        ),
                      ),
                    ),

                 currentProducts.isNotEmpty?
                 ListView.builder(
                        itemCount: currentProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.only(bottom: 100),
                        itemBuilder: (context, index) {
                          return Card(

                            shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: EdgeInsets.all(5),
                            child: Container(
                              // color: AppColors.scaffoldColor,
                              padding: EdgeInsets.only(right: 16),
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
                                        imageUrl: currentProducts[index].product!.image,
                                        placeholder: (context, url) => ClipRRect(
                                            borderRadius: BorderRadius.circular(20),

                                            child: Image.asset(AppImages.logo)),
                                        errorWidget: (context, url, error) => Image.asset(AppImages.logo),
                                      ),
                                    ),

                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        top: 16,
                                        right: 16,
                                      ),
                                      child: SizedBox(
                                        height: 100,
                                        child: Column(
                                          textDirection: TextDirection.rtl,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      currentProducts[index].product!.name! ,
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.w800,
                                                        fontSize: 18,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                  ),


                                                       Padding(
                                                          padding:
                                                              EdgeInsets.all(0.0),
                                                          child: IconButton(
                                                            icon: Icon( !checkFav(currentProducts[index].id) ? Icons
                                                                .favorite_border:Icons.favorite),
                                                            color: Colors.red,
                                                            onPressed: () {


                                                              if(checkFav(currentProducts[index].id) ){

                                                                LocalDB.removeItem(currentProducts[index],key: LocalDB.favKey);


                                                              }
                                                              else{
                                                                LocalDB.saveItem(currentProducts[index],key: LocalDB.favKey);

                                                              }

                                                              setState(() {


                                                              });
                                                            },
                                                          ),
                                                        )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                TextButton(
                                                  onPressed: () =>
                                                      ShowModalBottomSheetDitels(
                                                          context,
                                                          currentProducts[index]),
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty.all(
                                                              AppColors.iconcolor),
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(
                                                                  10),
                                                              side: BorderSide(
                                                                  color:AppColors.iconcolor))),
                                                      padding: MaterialStateProperty.all<EdgeInsets>(
                                                          EdgeInsets.symmetric(
                                                              horizontal: 20,
                                                              vertical: 2))),
                                                  child: Text(
                                                    'عرض الخيارات',
                                                    style: (TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.w400)),
                                                  ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  currentProducts[index].unitPrice
                                                          .toString() +
                                                      ' ر.ي ',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w800,
                                                    color: AppColors.primaryColor,
                                                  ),
                                                ),
                                                // Spacer(),
                                                SizedBox(
                                                  width: 20,
                                                )
                                              ],
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
                        }):Center(

                   child: Column(children: [
                     SizedBox(height: 50,),

                     Icon(Icons.info,size: 60,),
                     SizedBox(height: 20,),
                     Text('No Products '),

                   ],),
                 ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _allItems(String searchText) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue[800]),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                    side: BorderSide(color: Colors.blue))),
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 20, vertical: 2))),
        child: Text(
          'الكل',
          style: TextStyle(color: Colors.white),
        ),

        onPressed: () {
          setState(() {
            text = searchText;
          });
        });
  }

  Widget _singleItem(Category category) {
    bool selected=category==selectedCategory;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all( selected? AppColors.primaryColor:Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(color:selected?Colors.white: AppColors.primaryColor))),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 2))),

          child: Text(
            category.name,
            style: TextStyle(color: selected? Colors.white:AppColors.primaryColor),
          ),
          onPressed: () {
            setState(() {

              selectedCategory=category;
              updateCategory(category);

            });
          }),
    );
  }


  updateCategory(Category category){

    currentProducts=BaseController.allProducts.where((element) => element.product!.productCategoryId ==category.id).toList();
    setState(() {

    });
  }



  void ShowModalBottomSheetDitels(BuildContext context,Item item) {
    showModalBottomSheet(
      context: context,
      //  isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(30),
          )),
      builder: (context) => SingleChildScrollView(
        // controller: scrollController,
        child:  Directionality(

          textDirection: TextDirection.rtl,
          child: Column(
              children: [

                Padding(

                  padding: EdgeInsets.only(top: 25.0, right: 20.0, left: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(" ${item.product!.name}",style:TextStyle(color: Colors.black,
                              fontSize: 20,fontWeight: FontWeight.bold,),),
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [


                          Expanded(child: Text('${item.unit} ',style: AppStyles.primaryStyle(bold: true,fontSize: 16),))
                          ,
                          GestureDetector(

                              onTap: (){

                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                                decoration: BoxDecoration(

                                    color: AppColors.iconcolor,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${  item.unitPrice
                                        .toString() +
                                        ' ر.ي '} ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    // SizedBox(width: 20,),

                                  ],
                                ),
                              )),


                          SizedBox(width: 30,),

                          GestureDetector(

                              onTap: (){



                                  item.quantity = 1;

                                  LocalDB.saveItem(item,);
                                  setState(() {

                                  });


                                  BaseController().buildToastMsg(
                                      msg: 'تمت الإضافة الى السلة',
                                      success: true);

                                  Navigator.pop(context);


                              },

                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                // margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),

                                decoration: BoxDecoration(

                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('اضافه الى السلة ',textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                                    // SizedBox(width: 20,),

                                  ],
                                ),
                              )),


                        ],
                      ),
                      DottedLine(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.center,
                        lineLength: double.infinity,
                        lineThickness: 1.0,
                        dashLength: 4.0,
                        dashColor: Colors.black,
                        dashRadius: 0.0,
                        dashGapLength: 4.0,
                        dashGapColor: Colors.transparent,
                        dashGapRadius: 0.0,

                      )

                    ],
                  ),
                )





                , SizedBox(
                  height: 20,
                ),
                const Center(

                ),
                const SizedBox(
                  height: 30,
                ),

                const SizedBox(
                  height: 14,
                ),

              ]),
        ),
      ),
    );
  }



// => DefaultTabController(length: 5,
//       child:  Container(
//         height: 60,
//         child: SingleChildScrollView(
//           //scrollDirection: Axis.horizontal,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               TabBar(
//                 labelColor: Colors.black,
//                 tabs: [
//
//                   Tab(icon: Icon(Icons.food_bank,),text: 'حلويات',),
//
//                   Tab(icon: Icon(Icons.local_drink,),text: 'مشروبات',),
//                   Tab(icon: Icon(Icons.coffee_outlined,),text: 'ألبان',),
//                   Tab(icon: Icon(Icons.home,),text: 'معلبات',),
//                   Tab(icon: Icon(Icons.home,),text: 'اساسية',),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       )
// );
}

//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => DefaultTabController(length: 1, child: child) {
//     return  TabBar(
//           tabs: [
//             Tab(icon: Icon(Icons.home),text: 'Home',)
//           ],
//         );
//
//     // return Center(
//     //   child: Column(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     children: <Widget>[
//     //       Icon(Icons.shopping_basket_outlined),
//     //       Container(
//     //
//     //       ),
//     //
//     //     ],
//     //   ),
//     // );
//   }
// }
