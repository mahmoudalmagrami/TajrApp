
import 'package:dio/dio.dart';

import 'app_urls.dart';
import 'base_api.dart';
class AppApi{



final BaseApi _baseApi=BaseApi();
 Map<String,dynamic>  failedResult={"status":false,'msg':'no data'};
 Future<dynamic>getProducts()async{


 var response=await  _baseApi.dioGet(AppUrls.allProducts);

if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }


 Future<dynamic>getCartProducts(int userId)async{


 var response=await  _baseApi.dioGet(AppUrls.cartProducts+userId.toString());

if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }
 Future<dynamic>addToCart(int productId,int userid)async{
var data={'product_id':productId,'user_id':userid};

 var response=await  _baseApi.dioPost(AppUrls.addToCart,data);

if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }


}