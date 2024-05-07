import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_admin_panel/data/models/store.dart';

class SellerStoreRepository {
  SellerStoreRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // - - - - - - - - - - - - - - - - - - CREATE STORE AUTHENTICATION ( EMAIL + PASSWORD )- - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential> createStoreAuthAccount({required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // - - - - - - - - - - - - - - - - - - SAVE STORE INFO INTO FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> createNewStore({required Store store}) async {

    await _firebaseFirestore.collection("STORES").doc(store.id).set(store.toJson());
  }

  // - - - - - - - - - - - - - - - - - - DELETE STORE INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteStore({required String storeId}) async {
    await _firebaseFirestore.collection("STORES").doc(storeId).delete();
  }

  // - - - - - - - - - - - - - - - - - - SAVE IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<String> saveImage({required String imgName, required String imgPath}) async {
    final saveImg =  await _firebaseStorage.ref("STORES").child(imgName).putFile(File(imgPath));
    final imgUrl = await saveImg.ref.getDownloadURL();
    return imgUrl;
  }

  // - - - - - - - - - - - - - - - - - - DELETE IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteImage({required String imgName}) async {
    await _firebaseStorage.ref("STORES").child(imgName).delete();
  }

  // - - - - - - - - - - - - - - - - - - UPDATE STORE INFO  - - - - - - - - - - - - - - - - - -  //
  static Future<void> updateStore({required Store store}) async {
    await _firebaseFirestore.collection("STORES").doc(store.id).update(store.toJson());
  }

  // - - - - - - - - - - - - - - - - - - GET ALL STORES INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<List<Store>> getStores() async {
    final List<Store> stores = [];
    final QuerySnapshot<Map<String, dynamic>> storesCollection = await _firebaseFirestore.collection("STORES").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> storeJson in storesCollection.docs) {
      Store store = Store.fromJson(storeJson.data());
      stores.add(store);
    }
    return stores;
  }

  // - - - - - - - - - - - - - - - - - - GET STORE INFO FROM FIRESTORE BY ID - - - - - - - - - - - - - - - - - -  //
  static Future<Store?> getStoreById({required String storeId}) async {
    final DocumentSnapshot<Map<String, dynamic>> store = await _firebaseFirestore.collection("STORES").doc(storeId).get();
    if(store.data() == null) return null;
    return Store.fromJson(store.data()!);
  }

}
