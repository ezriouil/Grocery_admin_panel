import 'package:get/get.dart';

import '../../../data/models/command.dart';

class CommandDashboardController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final RxList<dynamic> commands;

  List<Command> list = [
    Command(
        clientName: "Mohamed",
        clientPhoneNumber: "0716058783",
        count: 2,
        createAt: "2020-02-12",
        id: "123456879",
        location: "Hay Rachad",
        note: "Please",
        price: 20,
        productId: "123456789",
        status: "Again",
        toDelivery: "Again"),
    Command(
        clientName: "Mohamed",
        clientPhoneNumber: "0716058783",
        count: 2,
        createAt: "2020-02-12",
        id: "123456879",
        location: "Hay Rachad",
        note: "Please",
        price: 20,
        productId: "123456789",
        status: "Again",
        toDelivery: "Again"),
    Command(
        clientName: "Mohamed",
        clientPhoneNumber: "0716058783",
        count: 2,
        createAt: "2020-02-12",
        id: "123456879",
        location: "Hay Rachad",
        note: "Please",
        price: 20,
        productId: "123456789",
        status: "Again",
        toDelivery: "Again"),
  ];

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    commands = [].obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    await fetchCommands();
  }

  // Fetch Commands
  Future<void> fetchCommands() async {
    try {
      //CustomLoading.start();
      commands.value = list;
      //CustomLoading.stop();
    } catch (e) {
      //CustomLoading.stop();
      error.value = e.toString();
      print(error.value);
    }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
