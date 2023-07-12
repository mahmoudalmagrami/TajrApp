class Item {
  final String name;
  final String id;
   int price,quantity;
  int favorite;
  final String ImageUrl;

  Item({
      required this.name,
    required this.price,
      required this.id,
      required this.favorite,
      required this.ImageUrl,this.quantity=1
  });
}

String text = "";
List<Item> ITEM_LIST = [
  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      price: 100,
      favorite: 0,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),
  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      favorite: 0,
      price: 100,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),

  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      price: 100,
      favorite: 0,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),
  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      price: 100,
      favorite: 0,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),

  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      price: 100,
      favorite: 0,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),
  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      favorite: 0,
      price: 100,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),

  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      favorite: 0,
      price: 100,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),
  Item(
      name: "شوكولاتة مليكا",
      id: "شوكولاتة",
      price: 100,
      favorite: 0,
      ImageUrl: "https://b.zmtcdn.com/data/pictures/chains/8/18427868/1269c190ab2f272599f8f08bc152974b.png"
  ),
];