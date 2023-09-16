
import 'package:dio/dio.dart';

import 'app_urls.dart';
import 'base_api.dart';
class AppApi{



final BaseApi _baseApi=BaseApi();
 Map<String,dynamic>  failedResult={"status":false,'message':'no data'};



Future<dynamic>login(Map<String,dynamic> data)async{

try {
  var response = await _baseApi.dioPost(AppUrls.login, data);
print(response.data);
  if (response.statusCode == 200) {
    return response.data;
  }
  else {
    return failedResult;
  }
}on DioException catch(error){


  // print(error.response!.statusCode);


  return {'message':'الرجاء التأكد من البيانات المدخلة قد يكون الحساب غير موجود '};

}


}
Future<dynamic>register(Map<String,dynamic> data)async{

try {
  var response = await _baseApi.dioPost(AppUrls.register, data);

// print(response.data);
  if (response.statusCode == 200) {
    return response.data;
  }
  else {
    return failedResult;
  }
} on DioException catch(error){


  print(error.response!.statusCode);


  return {'message':'الرجاء التأكد من البيانات المدخلة قد يكون الحساب موجود مسبقا'};

}


}



Future<dynamic>getCategories()async{


 var response=await  _baseApi.dioGet(AppUrls.categories);
// print(response.data);
if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }


 Future<dynamic>getProducts()async{


 var response=await  _baseApi.dioGet(AppUrls.allProducts);
// print(response.data);
if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }
 Future<dynamic>getAddress()async{


 var response=await  _baseApi.dioGet(AppUrls.address);
// print(response.data);
if(response.statusCode ==200){


  return response.data;
}
else{
  return failedResult;
}


 }
 Future<dynamic>getOrders()async{


 var response=await  _baseApi.dioGet(AppUrls.orders);
// print(response.data);
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
 Future<dynamic>addAddress(Map <String,dynamic> data,{int editId=0})async{
// var data={};
try {
// print(data);
 late Response<dynamic> response  ;

 if(editId>0){
   // print("${AppUrls.address}/$editId");
   // print(data);
  response= await _baseApi.dioPut(  '${AppUrls.address}/$editId', data);
 }
 else{
 response=  await _baseApi.dioPost(  AppUrls.address, data);
 }

 print(response.statusCode);
 print(response.data);

  if (response.statusCode! == 200  ||response.statusCode! == 201 ) {
    return {'status':true,'message':'successfully'};
  }
  else {
    return {'status':false,'message':'Failed to Add'};

  }
}on DioException catch(_){

  return {'status':false,'message':'Failed to Add'};

}

 }
 Future<dynamic>addOrder(Map <String,dynamic> data,)async{
// var data={};
try {

var  response=  await _baseApi.dioPost(  AppUrls.orders, data);


 print(response.statusCode);
 print(response.data);

  if (response.statusCode! == 200  ||response.statusCode! == 201 ) {
    return {'status':true,'message':'successfully'};
  }
  else {
    return {'status':false,'message':'Failed to Add'};

  }
}on DioException catch(_){

  return {'status':false,'message':'Failed to Add'};

}

 }





 /// offers


Future<dynamic>getOffers()async{


  var response=await  _baseApi.dioGet(AppUrls.offers);
// print(response.data);
  if(response.statusCode ==200){


    return response.data;
  }
  else{
    return failedResult;
  }


}
Future<dynamic>getOfferProducts(int id)async{


  var response=await  _baseApi.dioGet('${AppUrls.offersStore}$id');
// print(response.data);
  if(response.statusCode ==200){


    return response.data;
  }
  else{
    return failedResult;
  }


}



Future<dynamic>confirmOrder(int id,bool status)async{


  var response=await  _baseApi.dioPut(AppUrls.confirmOrder(id),{'status':status});
// print(response.data);
  if(response.statusCode! >=200  && response.statusCode! <300){


    return {'status':true,'message':'successfully'};
  }
  else{
    return failedResult;
  }


}


}