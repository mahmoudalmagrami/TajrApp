
import 'package:sell/data/api/app_api.dart';
import 'package:sell/data/models/product.dart';

class AppRepository{

AppApi appApi=AppApi();


  Future<List<Product>> getProducts()async{


  var result= await appApi.getProducts();

  if(result is List){


   return result.map((e) => Product.fromJson(e)).toList();



  }
  else{
    return [];
  }


}


}