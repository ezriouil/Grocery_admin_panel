import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';

import '../../models/command.dart';

class CommandRepository {
  CommandRepository._();

  // - - - - - - - - - - - - - - - - - - CREATE INSTANCES - - - - - - - - - - - - - - - - - -  //
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;
  static final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // - - - - - - - - - - - - - - - - - - GET ALL COMMANDS FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<List<Command>> getCommands() async {
    final List<Command> commands = [];
    final QuerySnapshot<Map<String, dynamic>> commandsCollection =
        await _firebaseFirestore.collection("COMMANDS").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> commandJson
        in commandsCollection.docs) {
      Command command = Command.fromJson(commandJson.data());
      commands.add(command);
    }

    return commands;
  }

  // - - - - - - - - - - - - - - - - - - GET COMMAND INFO FROM FIRESTORE BY ID - - - - - - - - - - - - - - - - - -  //
  static Future<Command?> getCommandById({required String commandId}) async {
    final DocumentSnapshot<Map<String, dynamic>> command =
        await _firebaseFirestore.collection("COMMANDS").doc(commandId).get();
    if (command.data() != null) {
      return null;
    }
    return Command.fromJson(command.data()!);
  }

  // - - - - - - - - - - - - - - - - - - UPDATE COMMAND INFO  - - - - - - - - - - - - - - - - - -  //
  static Future<void> updateCommand({required Command command}) async {
    await _firebaseFirestore
        .collection("COMMANDS")
        .doc(command.id)
        .update(command.toJson());
  }

  // - - - - - - - - - - - - - - - - - - DELETE COMMAND FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteCommand({required String commandId}) async {
    await _firebaseFirestore.collection("COMMANDS").doc(commandId).delete();
  }

  // - - - - - - - - - - - - - - - - - - DELETE COMMAND IMAGE - - - - - - - - - - - - - - - - - -  //
  static Future<void> deleteImage({required String imgName}) async {
    await _firebaseStorage.ref("COMMANDS").child(imgName).delete();
  }

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS OF SPECIFIC STORE FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  static Future<List<Command>> getDeliveryCommandsById(
      {required String deliveryId}) async {
    final List<Command> commands = [];
    final QuerySnapshot<Map<String, dynamic>> commandsCollection =
        await _firebaseFirestore.collection("COMMANDS").get();

    for (QueryDocumentSnapshot<Map<String, dynamic>> commandJson
        in commandsCollection.docs) {
      if (commandJson.data()['id'] == deliveryId) {
        Command store = Command.fromJson(commandJson.data());
        commands.add(store);
      }
    }

    return commands;
  }
}
