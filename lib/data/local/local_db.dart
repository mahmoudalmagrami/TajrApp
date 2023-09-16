
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:sell/models/item.dart';

class LocalDB{

  LocalDB._();



 static GetStorage box=GetStorage();

  static const String favKey='fav';
  static const String cartKey='cartKey';



  static Future<List<Item>> readItems({String key=cartKey})async{
    final GetStorage box=GetStorage();

    dynamic d= box.read(key) ;
    List<Item> items=[];

    // logger.i('models data :  ******************************   $d');

    if(d !=null) {
      //   List<dynamic> oldSavedList = jsonDecode(d);

      items.clear();
      for (var element in d ) {



          var s = (jsonEncode(element));

          Map<String, dynamic> tt = (json.decode(s));


          var dvv = Item.fromJson(tt);




          items.add(dvv);

      }





    }


    return items;


  }


  static saveItem(Item item,{String key=cartKey}) async{


    bool isExist=false;
    /// getting all saved data
    List<Item> oldSavedData= await readItems(key: key) ;

    //  print('oldSavedData :************************************  $oldSavedData');


    // List<dynamic>? oldSavedData = box.read('devices1');

    /// in case there is saved data
    if(oldSavedData.isNotEmpty){





      for (var element in oldSavedData) {

        if(element.id==item.id){

          isExist=true;

        }


      }




      // run();

      if(!isExist) {
        oldSavedData.add(item);

        /// save the new collection
        ///
        ///

        return box.write(key, oldSavedData.map((e) => e.toJson()).toList());
      }
    } else{
      // run();

      /// in case of there is no saved data -- add the new list to storage
      return box.write(key, [item.toJson()]);


    }
  }
  static updateItem(Item item,{String key=cartKey}) async{


    /// getting all saved data
    List<Item> oldSavedData= await readItems(key: key) ;

    //  print('oldSavedData :************************************  $oldSavedData');


    // List<dynamic>? oldSavedData = box.read('devices1');

    /// in case there is saved data
    if(oldSavedData.isNotEmpty){





      for (var element in oldSavedData) {

        if(element.id==item.id){

         int index=  oldSavedData.indexOf(element);
         oldSavedData[index]=item;

          /// save the new collection
          ///
          ///

          return box.write(key, oldSavedData.map((e) => e.toJson()).toList());
        }


      }







    }
  }




  static removeItem(Item item,{String key=cartKey}) async{



    /// getting all saved data
    List<Item> oldSavedData= await readItems(key: key) ;



    // List<dynamic>? oldSavedData = box.read('devices1');

    /// in case there is saved data
    if(oldSavedData.isNotEmpty){



      oldSavedData.removeWhere((element) => element.id ==item.id);






      /// save the new collection
       box.write(key, oldSavedData.map((e) => e.toJson()).toList());






    }
  }
  static removeAllItems({String key=cartKey}) async {
    box.write(key, null);
  }


}