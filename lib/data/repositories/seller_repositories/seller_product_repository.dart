import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_admin_panel/data/models/product.dart';

class SellerProductRepository {
  SellerProductRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<List<Product>> getProducts() async {
    final List<Product> products = [];
    final QuerySnapshot<Map<String, dynamic>> productsCollection = await _firebaseFirestore.collection("PRODUCTS").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> storeJson in productsCollection.docs) {
      Product store = Product.fromJson(storeJson.data());
      products.add(store);
    }

    return products;
  }

  // - - - - - - - - - - - - - - - - - - SAVE PRODUCT INFO INTO FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> createNewProduct({required Product product}) async {
    await _firebaseFirestore.collection("PRODUCTS").doc(product.id).set(product.toJson());
  }

  // - - - - - - - - - - - - - - - - - - UPDATE PRODUCT INFO - - - - - - - - - - - - - - - - - -  //
  static Future<void> updateProduct({required Product product}) async {
    await _firebaseFirestore.collection("PRODUCTS").doc(product.id).update(product.toJson());
  }

  // - - - - - - - - - - - - - - - - - - DELETE PRODUCT INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteStore({required String productId}) async {
    await _firebaseFirestore.collection("PRODUCTS").doc(productId).delete();
  }

  // - - - - - - - - - - - - - - - - - - SAVE IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<String> saveImage({required String imgName, required String imgPath}) async {
    final saveImg =  await _firebaseStorage.ref("PRODUCTS").child(imgName).putFile(File(imgPath));
    final imgUrl = await saveImg.ref.getDownloadURL();
    return imgUrl;
  }

  // - - - - - - - - - - - - - - - - - - DELETE IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteImage({required String imgName, required String imgPath}) async {
    await _firebaseStorage.ref("PRODUCTS").child(imgName).delete();
  }
}
