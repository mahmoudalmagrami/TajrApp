
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sell/base_controller.dart';
class BaseApi {


final String baseUrl='https://jumlati.online/api/';
  final dio = Dio(
    BaseOptions(
      //   followRedirects: false,
      //   validateStatus: (status) { return status! < 500; },
      contentType: ("application/json"),
      headers: {
        if(BaseController.currentUser !=null)
        'Authorization': 'Bearer ${BaseController.currentUser!.token}',

      }

    )

  );


  Future<Response> dioGet(String endPath)async{


    return await dio.get(baseUrl+endPath);



  }
  Future<Response> dioPost(String endPath,Map<String,dynamic>  data)async{


    return await dio.post(baseUrl+endPath,data: FormData.fromMap(data));



  }
  Future<Response> dioPut(String endPath,Map<String,dynamic>  data)async{


    return await dio.put(baseUrl+endPath,data: (data));



  }



}