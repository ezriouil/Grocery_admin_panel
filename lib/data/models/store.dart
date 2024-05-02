class Store {

  // - - - - - - - - - - - - - - - - - - STATES - - - - - - - - - - - - - - - - - -  //
  late final String? id, title, description, image, location, email, password, phoneNumber, webSite, createAt;

  // - - - - - - - - - - - - - - - - - - CONSTRUCTOR- - - - - - - - - - - - - - - - - -  //
  Store({this.id = "", this.title = "", this.description = "", this.image = "", this.location = "", this.email = "", this.password = "", this.phoneNumber = "", this.webSite = "", this.createAt = ""});

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
        'webSite': webSite,
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
        webSite: json['webSite'] as String,
        createAt: json['createAt'] as String,
    );
  }

  // - - - - - - - - - - - - - - - - - - COPY - - - - - - - - - - - - - - - - - -  //
  Store copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? location,
    String? email,
    String? password,
    String? phoneNumber,
    String? createAt,
  }) {
    return Store(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      location: location ?? this.location,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      createAt: createAt ?? this.createAt,
    );
  }

}
