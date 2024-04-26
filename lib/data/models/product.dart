class Product {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id,
      idStore,
      storeName,
      title,
      description,
      image1,
      image2,
      image3;
  late final bool inStock, hasPermission;
  late final int oldPrice, price;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Product(
      {this.id = "",
      this.idStore = "",
      this.storeName = "",
      this.title = "",
      this.description = "",
      this.image1 = "",
      this.image2 = "",
      this.image3 = "",
      this.oldPrice = 0,
      this.price = 0,
      this.inStock = true
      this.hasPermission = true
       });

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'idStore': idStore,
        'storeName': storeName,
        'title': title,
        'description': description,
        'image1': image1,
        'image2': image2,
        'image3': image3,
        'oldPrice': oldPrice,
        'price': price,
        'inStock': inStock,
        'hasPermission': hasPermission,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Product fromJson(Map json) {
    return Product(
      id: json['id'] as String,
      idStore: json['idStore'] as String,
      storeName: json['storeName'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image1: json['image1'] as String,
      image2: json['image2'] as String,
      image3: json['image3'] as String,
      oldPrice: json['oldPrice'] as int,
      price: json['price'] as int,
      inStock: json['inStock'] as bool,
      hasPermission: json['hasPermission'] as bool,
    );
  }
}
