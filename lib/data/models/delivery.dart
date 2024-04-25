class Delivery {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id,
      fullName,
      image,
      phoneNumber,
      location,
      createAt;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Delivery(
      {this.id = "",
      this.fullName = "",
      this.image = "",
      this.phoneNumber = "",
      this.location = "",
      this.createAt = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'image': image,
        'phoneNumber': phoneNumber,
        'location': location,
        'createAt': createAt
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Delivery fromJson(Map json) {
    return Delivery(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      image: json['image'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      createAt: json['createAt'] as String
    );
  }
}
