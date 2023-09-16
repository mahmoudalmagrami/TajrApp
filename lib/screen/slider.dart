import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sell/HomeScreen/offer_store_page.dart';
import 'package:sell/const/app_colors.dart';
import 'package:sell/const/app_styles.dart';

import '../app_const/app_images.dart';
import '../models/offer.dart';
void main() {
  runApp( CarouselDemo());
}

final List<String> imgList = [

  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

final themeMode = ValueNotifier(2);

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(

          // home: EnlargeStrategyDemo(),

          debugShowCheckedModeBanner: false,

        );
      },
      valueListenable: themeMode,
    );
  }
}

class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  DemoItem(this.title, this.route);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}



class ImageSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1
          ),
          items: imgList
              .map((item) => Container(
            child: Center(
                child:
                Image.network(item, fit: BoxFit.cover, width: 1000,height: 150,)),
          ))
              .toList(),
        ));
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
  // color: Colors.amber,
      height: 250,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.network(item, width: 1000,),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(20, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),

                ),
              ),
            ],
          )),
    ))
    .toList();



class EnlargeStrategyDemo extends StatelessWidget {
  const EnlargeStrategyDemo({super.key,required this.offers});


 final List<Offer> offers;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(title: Text('Complicated image slider demo')),
      body: Container(
        height: 250,
        width: 1000,
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            //viewportFraction: 1,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
          items: getOfferWidget(context),
        ),
      ),
    );
  }

  getOfferWidget(BuildContext context){

    return offers
        .map((item) => Container(
      // color: Colors.amber,
      height: 250,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Container(
                color: AppColors.backgroundicon,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: item.image ??'',width: 1000,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => ClipRRect(
                        borderRadius: BorderRadius.circular(20),

                        child: Image.asset(AppImages.logo,width: 1000,
                          fit: BoxFit.fill,

                        )),
                    errorWidget: (context, url, error) => Image.asset(AppImages.logo,width: 1000,
                      fit: BoxFit.fill,

                    ),
                  ),
                ),
              ),

              Positioned(
                  bottom: 10,
                  right: 5,
                  left: 5,

                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [


                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => OfferStorePage(offer: item),
                          ),
                        );

                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,borderRadius: BorderRadius.circular(20),

                        ),

                        child: Text('تفاصيل العرض',style: AppStyles.primaryStyle(bold: true,fontSize: 14,color: AppColors.white),),

                      ),
                    )

                ],
              ),
                  )),

              // Positioned(
              //   bottom: 0.0,
              //   left: 0.0,
              //   right: 0.0,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           Color.fromARGB(20, 0, 0, 0),
              //           Color.fromARGB(0, 0, 0, 0)
              //         ],
              //         begin: Alignment.bottomCenter,
              //         end: Alignment.topCenter,
              //       ),
              //     ),
              //     padding: EdgeInsets.symmetric(
              //         vertical: 10.0, horizontal: 20.0),
              //
              //   ),
              // ),
            ],
          )),
    ))
        .toList();
  }

}

