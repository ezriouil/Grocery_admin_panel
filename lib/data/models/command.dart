class Command {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id,
      productId,
      status,
      createAt,
      clientName,
      clientPhoneNumber,
      location,
      note,
      toDelivery;
  late final int count, price;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Command(
      {this.id = "",
      this.productId = "",
      this.status = "",
      this.createAt = "",
      this.clientName = "",
      this.clientPhoneNumber = "",
      this.location = "",
      this.note = "",
      this.toDelivery = "",
      this.price = 0,
      this.count = 0});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'status': status,
        'createAt': createAt,
        'clientName': clientName,
        'clientPhoneNumber': clientPhoneNumber,
        'location': location,
        'note': note,
        'toDelivery': toDelivery,
        'price': price,
        'count': count,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Command fromJson(Map json) {
    return Command(
      id: json['id'] as String,
      productId: json['productId'] as String,
      status: json['status'] as String,
      createAt: json['createAt'] as String,
      location: json['location'] as String,
      clientName: json['clientName'] as String,
      clientPhoneNumber: json['clientPhoneNumber'] as String,
      note: json['note'] as String,
      toDelivery: json['toDelivery'] as String,
      price: json['price'] as int,
      count: json['count'] as int,
    );
  }
}
