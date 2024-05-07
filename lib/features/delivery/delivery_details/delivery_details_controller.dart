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
  late final Rx<int> newCommand, confirmedCommand, declinedCommand, waitCommand;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    delivery = Delivery().obs;
    newCommand = 0.obs;
    confirmedCommand = 0.obs;
    declinedCommand = 0.obs;
    waitCommand = 0.obs;
    commands = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {

    await getDeliveryInfo();
  }

  // - - - - - - - - - - - - - - - - - - GET COMMANDS STATUS - - - - - - - - - - - - - - - - - -  //
  List<Command> commandstest = [
    Command(
        location: "Rabat",
        createAt: "2024-02-02",
        id: "123456789",
        toDelivery: "yes",
        status: "NEW",
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
        status: "WAIT",
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
        status: "CONFIRMED",
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
        status: "CONFIRMED",
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
        status: "DECLINED",
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
        status: "DECLINED",
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
        status: "DECLINED",
        productId: "123456789",
        price: 20,
        note: "this is so good",
        count: 4,
        clientPhoneNumber: "0716058783",
        clientName: "Ahmed"),
  ];

  // - - - - - - - - - - - - - - - - - - GET DELIVERY INFO - - - - - - - - - - - - - - - - - -  //


  getDeliveryInfo() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      /// GET DELIVERY INFO FROM FIRESTORE
      final deliveryInfo = await DeliveryRepository.getDeliveryById(deliveryId: _deliveryId);
      if (deliveryInfo == null) {
        CustomLoading.stop();
        error.value = "Not Found";
        return;
      }
      delivery.value = deliveryInfo;

      /// GET PRODUCTS OF THE STORE
      final deliveryCommands = await CommandRepository.getDeliveryCommandsById(deliveryId: _deliveryId);
      commands.addAll(deliveryCommands);
      for (Command command in commandstest) {
        //commands.add(command);
        switch (command.status) {
          case "NEW":
            {
              newCommand.value += 1;
              break;
            }
          case "CONFIRMED":
            {
              confirmedCommand.value += 1;
              break;
            }
          case "DECLINED":
            {
              declinedCommand.value += 1;
              break;
            }
          case "WAIT":
            {
              waitCommand.value += 1;
              break;
            }
        }

      }

      /// STOP LOADER
      CustomLoading.stop();
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - DELETE DELIVERY INFO - - - - - - - - - - - - - - - - - -  //

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
                      await DeliveryRepository.deleteImage(imgName: delivery.value.id ?? "");
                      await DeliveryRepository.deleteDelivery(deliveryId: _deliveryId);
                      //:: DELETE DELIVERY COMMANDS :://

                      /// STOP LOADING
                      CustomLoading.stop();
                      await Future.delayed(const Duration(milliseconds: 500));
                      Get.back();

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
