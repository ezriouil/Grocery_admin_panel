import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../models/delivery.dart';

class DeliveryRepository {
  DeliveryRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // - - - - - - - - - - - - - - - - - - CREATE DELIVERY AUTHENTICATION ( EMAIL + PASSWORD )- - - - - - - - - - - - - - - - - -  //
  static Future<UserCredential> createDeliveryAuthAccount({required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // - - - - - - - - - - - - - - - - - - SAVE DELIVERY INFO INTO FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> createNewDelivery({required Delivery delivery}) async {
    await _firebaseFirestore
        .collection("DELIVERIES")
        .doc(delivery.id)
        .set(delivery.toJson());
  }

  // - - - - - - - - - - - - - - - - - - DELETE DELIVERY INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteDelivery({required String deliveryId}) async {
    await _firebaseFirestore.collection("DELIVERIES").doc(deliveryId).delete();
  }

  // - - - - - - - - - - - - - - - - - - SAVE DELIVERY IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<String> saveImage({required String imgName, required String imgPath}) async {
    final saveImg = await _firebaseStorage
        .ref("DELIVERIES")
        .child(imgName)
        .putFile(File(imgPath));
    final imgUrl = await saveImg.ref.getDownloadURL();
    return imgUrl;
  }

  // - - - - - - - - - - - - - - - - - - DELETE DELIVERY IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteImage({required String imgName}) async {
    await _firebaseStorage.ref("DELIVERIES").child(imgName).delete();
  }

  // - - - - - - - - - - - - - - - - - - UPDATE DELIVERY INFO  - - - - - - - - - - - - - - - - - -  //
  static Future<void> updateDelivery({required Delivery delivery}) async {
    await _firebaseFirestore
        .collection("DELIVERIES")
        .doc(delivery.id)
        .update(delivery.toJson());
  }

  // - - - - - - - - - - - - - - - - - - GET ALL DELIVERIES FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<List<Delivery>> getDeliveries() async {
    final List<Delivery> deliveries = [];
    final QuerySnapshot<Map<String, dynamic>> deliveriesCollection =
        await _firebaseFirestore.collection("DELIVERIES").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> deliveryJson in deliveriesCollection.docs) {
      Delivery delivery = Delivery.fromJson(deliveryJson.data());
      deliveries.add(delivery);
    }

    return deliveries;
  }

  // - - - - - - - - - - - - - - - - - - GET DELIVERY INFO FROM FIRESTORE BY ID - - - - - - - - - - - - - - - - - -  //
  static Future<Delivery?> getDeliveryById({required String deliveryId}) async {
    final DocumentSnapshot<Map<String, dynamic>> delivery = await _firebaseFirestore.collection("DELIVERIES").doc(deliveryId).get();
    if(delivery.data() == null){
      return null;
    }
    return Delivery.fromJson(delivery.data()!);
  }

}
