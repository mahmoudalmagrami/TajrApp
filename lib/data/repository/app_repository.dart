
import 'package:dio/dio.dart';
import 'package:sell/models/address.dart';
import 'package:sell/models/item.dart';
import 'package:sell/data/api/app_api.dart';
import 'package:sell/data/models/product.dart';

import '../../models/category.dart';
import '../../models/offer.dart';
import '../../models/order.dart';

class AppRepository{

AppApi appApi=AppApi();


  Future<List<Category>> getCategories()async{


    try {
      var result = await appApi.getCategories();

      if (result['data'] != null && result['data'] is List) {
        var data = result['data'] as List;
        return data.map((e) => Category.fromJson(e)).toList();
      }
      else {
        return [];
      }
    }catch(_){
      return [];
    }


}



  Future<List<Item>> getProducts()async{

try{
  var result= await appApi.getProducts();

  if( result['data'] != null && result['data'] is List){

var data=result['data'] as List;
   return data.map((e) => Item.fromJson(e)).toList();



  }
  else{
    return [];
  }
}catch(_){
  return [];
}

}


Future<List<Address>> getAddress()async{

  try{
    var result= await appApi.getAddress();

    if( result['data'] != null && result['data'] is List){

      var data=result['data'] as List;
      return data.map((e) => Address.fromJson(e)).toList();



    }
    else{
      return [];
    }
  }catch(_){
    return [];
  }

}


Future <dynamic> addAddress(Map<String,dynamic>  data,{int editId=0})async{

var res= await appApi.addAddress(data,editId: editId);


  return res;



}



Future <dynamic> addOrder(Map<String,dynamic>  data)async{

var res= await appApi.addOrder(data,);


  return res;



}



Future<List<Order>> getOrders()async{

  try{
    var result= await appApi.getOrders();

    // print(result);
    if( result['data'] != null && result['data'] is List){

      var data=result['data'] as List;
      return data.map((e) => Order.fromJson(e)).toList();



    }
    else{
      return [];
    }
  }catch(_){
    return [];
  }

}



Future<List<Offer>> getOffers()async{

  try{
    var result= await appApi.getOffers();

    // print(result);
    if( result['data'] != null && result['data'] is List){

      var data=result['data'] as List;
      return data.map((e) => Offer.fromJson(e)).toList();



    }
    else{
      return [];
    }
  }catch(_){
    return [];
  }

}

Future<List<Item>> getOfferProducts(int id)async{

  try{
    var result= await appApi.getOfferProducts(id);

    if( result['data'] != null && result['data'] is List){

      var data=result['data'] as List;
      return data.map((e) => Item.fromJson(e['store'])).toList();



    }
    else{
      return [];
    }
  }catch(_){
    return [];
  }

}

//confirmOrder

  Future <dynamic> confirmOrder(int id,bool status)async{

    var res= await appApi.confirmOrder(id,status);


    return res;



  }

}