
import 'package:dio/dio.dart';
class BaseApi{


final String baseUrl='https://fakestoreapi.com/';
  final dio = Dio();


  Future<Response> dioGet(String endPath)async{


    return await dio.get(baseUrl+endPath);



  }
  Future<Response> dioPost(String endPath,Map<String,dynamic>  data)async{


    return await dio.post(baseUrl+endPath,data: FormData.fromMap(data));



  }



}