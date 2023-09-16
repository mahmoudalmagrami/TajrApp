// import 'package:sell/data/models/product.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import 'models/app_user.dart';
import 'models/item.dart';

class BaseController{

 static List<Item> cartItems=[];
 // static List<Item> favItems=allProducts.where((element) => element.favorite>0).toList();

static AppUser? currentUser;

static final  GetStorage authBox=GetStorage();

initDB(){

 var userData= authBox.read('user');

 print("************************* userData  $userData");
if(userData !=null){
 var decode=json.decode(userData);

 currentUser=AppUser.fromJson(decode);

}
}

static get favItemsList=>allProducts.where((element) => element.fav>0).toList();

 static List<Item> allProducts=[
  //
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "شوكولاتة",
  //     price: 100,
  //     favorite: 0,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Button",
  //     favorite: 0,
  //     price: 100,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  //
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Page",
  //     price: 100,
  //     favorite: 0,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Text",
  //     price: 100,
  //     favorite: 0,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  //
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "UI",
  //     price: 100,
  //     favorite: 0,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Drawer",
  //     favorite: 0,
  //     price: 100,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  //
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Background",
  //     favorite: 0,
  //     price: 100,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),
  // Item(
  //     name: "شوكولاتة مليكا",
  //     id: "Animation",
  //     price: 100,
  //     favorite: 0,
  //     ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  // ),

 ];



 buildToastMsg({String msg='',bool success=false}){


  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor:success?Colors.green: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0
  );


 }


}