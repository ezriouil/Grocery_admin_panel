class Store {

  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id, title, description, image, location, email, password, phoneNumber, createAt;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Store({this.id = "", this.title = "", this.description = "", this.image = "", this.location = "", this.email = "", this.password = "", this.phoneNumber = "", this.createAt = ""});

  // - - - - - - - - - - - - - - - - - - TO JSON - - - - - - - - - - - - - - - - - -  //
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'location': location,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'createAt': createAt,
      };

  // - - - - - - - - - - - - - - - - - - FROM JSON- - - - - - - - - - - - - - - - - -  //
  static Store fromJson(Map json) {
    return Store(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
        location: json['location'] as String,
        email: json['email'] as String,
        password: json['password'] as String,
        phoneNumber: json['phoneNumber'] as String,
        createAt: json['createAt'] as String,
    );
  }
}
