class Delivery {
  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id,
      fullName,
      image,
      phoneNumber,
      email,
      password,
      location,
      createAt;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Delivery(
      {this.id = "",
      this.fullName = "",
      this.image = "",
      this.phoneNumber = "",
      this.email = "",
      this.password = "",
      this.location = "",
      this.createAt = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'fullName': fullName,
        'image': image,
        'phoneNumber': phoneNumber,
        'email': email,
        'password': password,
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
      email: json['email'] as String,
      password: json['password'] as String,
      location: json['location'] as String,
      createAt: json['createAt'] as String
    );
  }
}
