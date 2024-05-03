import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/command.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:grocery_admin_panel/data/repositories/command_repositories/command_repository.dart';
import 'package:grocery_admin_panel/data/repositories/delivery_repositories/delivery_repository.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_loading.dart';
import '../../../common/widgets/custom_outlined_button.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../delivery_edit/delivery_edit_screen.dart';

class DeliveryDetailsController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final Rx<Delivery> delivery;
  late final RxList<Command> commands;
  final String _deliveryId = Get.arguments as String;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    delivery = Delivery().obs;
    commands = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - GET COMMANDS STATUS - - - - - - - - - - - - - - - - - -  //
  List<Command> commandstest = [
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "New",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Wait",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Accept",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Accept",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Refuse",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Refuse",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "Refuse",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
  ];

  Map<String, int> countStatusOccurrences(List<Command> commands) {
    Map<String, int> statusCounts = {};

    // Count occurrences of each status
    for (Command command in commands) {
      if (statusCounts.containsKey(command.status)) {
        statusCounts[command.status!] = (statusCounts[command.status!]! + 1);
      } else {
        statusCounts[command.status!] = 1;
      }
    }

    return statusCounts;
  }


  getDeliveryInfo() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      /// GET DELIVERY INFO FROM FIRESTORE
      final deliveryInfo =
          await DeliveryRepository.getDeliveryById(deliveryId: _deliveryId);
      if (deliveryInfo == null) {
        CustomLoading.stop();
        error.value = "Not Found";
        return;
      }
      delivery.value = deliveryInfo;

      /// GET PRODUCTS OF THE STORE
      final deliveryCommands = await CommandRepository.getDeliveryCommandsById(
          deliveryId: _deliveryId);
      if (deliveryCommands.isNotEmpty) {
        commands.addAll(deliveryCommands);
      }

      /// STOP LOADER
      CustomLoading.stop();
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  onDeleteDelivery() async {
    Get.defaultDialog(
      title: "Are you sure",
      content: Row(
        children: [
          Expanded(
              child: CustomOutlinedButton(
                  text: "Cancel",
                  withDefaultPadding: false,
                  onClick: Get.back)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Expanded(
              child: CustomElevatedButton(
                  text: "Delete",
                  withDefaultPadding: false,
                  onClick: () async {
                    try {
                      /// START LOADING
                      CustomLoading.start();




                      /// DELETE STORE WITH HIS PRODUCTS

                      await DeliveryRepository.deleteImage(
                          imgName: delivery.value.id ?? "");
                      await DeliveryRepository.deleteDelivery(
                          deliveryId: _deliveryId);

                      /// STOP LOADING
                      CustomLoading.stop();
                      CustomLoading.stop();

                      await Future.delayed(const Duration(milliseconds: 500));
                    } catch (e) {
                      /// STOP LOADING
                      CustomLoading.stop();
                      error.value = e.toString();
                    }
                  })),
        ],
      ),
    );
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    print(await getDeliveryInfo());
    print(_deliveryId);
    await getDeliveryInfo();
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }

  onNavigateToDeliveryEditScreen() {
    Get.to(DeliveryEditScreen(), arguments: _deliveryId);
  }
}
