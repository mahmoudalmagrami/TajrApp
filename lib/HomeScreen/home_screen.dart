import 'package:flutter/material.dart';
import 'package:sell/const/app_strings.dart';
import 'package:sell/data/api/app_api.dart';
import 'package:sell/screen/bottomSheetDitals.dart';
import 'package:iconsax/iconsax.dart';
import '../Item/item.dart';
import '../base_controller.dart';
import '../const/app_colors.dart';
import '../data/models/product.dart';
import '../data/repository/app_repository.dart';
import '../screen/slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  AppRepository appRepository=AppRepository();
  bool isLoading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllProducts();
  }
  getAllProducts()async{

    setState(() {
      isLoading=true;
    });
  BaseController.allProducts=await   appRepository.getProducts();

  setState(() {
    isLoading=false;
  });

  }


  @override
  Widget build(BuildContext context) {
    List<Item> searchList = ITEM_LIST
        .where((element) =>
            element.name.toLowerCase().contains(text.toLowerCase()))
        .toList();
    return Scaffold(
      backgroundColor:AppColors.scaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.appName,
          style: TextStyle(
              fontWeight: FontWeight.w900, color: Colors.white, fontSize: 17),
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
          child: Column(
            children: [
              SizedBox(height: 250, child: EnlargeStrategyDemo()),
              Container(
                height: 50,
                color: Colors.white.withOpacity(0.7),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 10),
                      _allItems(""),
                      const SizedBox(width: 10),
                      _singleItem("مواد غذائية اساسية"),
                      SizedBox(width: 10),
                      _singleItem("شوكولاتة"),
                      SizedBox(width: 10),
                      _singleItem("ألبان"),
                      SizedBox(width: 10),
                      _singleItem("عصائر"),
                      SizedBox(width: 10),
                      _singleItem("شوكولاتة"),
                      SizedBox(width: 10),
                      _singleItem("حلويات"),
                      SizedBox(width: 10),
                      _singleItem("كيكات"),
                      SizedBox(width: 10),
                      _singleItem("معلبات"),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                  itemCount: BaseController.allProducts.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      margin: EdgeInsets.all(5),
                      child: Container(
                        // color: AppColors.scaffoldColor,
                        padding: EdgeInsets.only(right: 16),
                        height: 110,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                BaseController.allProducts[index].image ??'',
                                fit: BoxFit.fill,
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
                                                BaseController.allProducts[index].title! ,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 18,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ),
                                            BaseController.allProducts[index]
                                                        .fav ==
                                                    0
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    child: IconButton(
                                                      icon: Icon(Icons
                                                          .favorite_border),
                                                      color: Colors.red,
                                                      onPressed: () {
                                                        setState(() {
                                                          BaseController
                                                              .allProducts[
                                                                  index]
                                                              .fav++;
                                                        });
                                                      },
                                                    ),
                                                  )
                                                : IconButton(
                                                    icon: Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        BaseController
                                                            .allProducts[index]
                                                            .fav--;
                                                      });
                                                    },
                                                  ),
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
                                                    BaseController
                                                        .allProducts[index]),
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        AppColors.iconcolor),
                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(
                                                            10),
                                                        side: BorderSide(
                                                            color:Colors.amber))),
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
                                            BaseController
                                                    .allProducts[index].price
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
                  })
            ],
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

  Widget _singleItem(String searchText) {
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
          searchText,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          setState(() {
            text = searchText;
          });
        });
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
