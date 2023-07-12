import 'package:sell/data/models/product.dart';

import 'Item/item.dart';

class BaseController{

 static List<Product> cartItems=[];
 // static List<Item> favItems=allProducts.where((element) => element.favorite>0).toList();


static get favItemsList=>allProducts.where((element) => element.fav>0).toList();

 static List<Product> allProducts=[
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




}