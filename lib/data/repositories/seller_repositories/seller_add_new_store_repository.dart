import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_admin_panel/data/models/store.dart';

class SellerAddNewStoreRepository {
  SellerAddNewStoreRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // - - - - - - - - - - - - - - - - - - CREATE STORE AUTHENTICATION ( EMAIL + PASSWORD )- - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential> createStoreAuthAccount({required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  // - - - - - - - - - - - - - - - - - - SAVE IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<String> saveImage({required String imgName, required String imgPath}) async {
    final saveImg =  await _firebaseStorage.ref("STORES_LOGOS").child(imgName).putFile(File(imgPath));
    final imgUrl = await saveImg.ref.getDownloadURL();
    return imgUrl;
  }

  // - - - - - - - - - - - - - - - - - - SAVE STORE INFO INTO FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> createNewStore({required Store store}) async {
    await _firebaseFirestore.collection("STORES").doc(store.id).set(store.toJson());
  }

}
