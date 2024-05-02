import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
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
  late final RxList<Delivery>deliveries;
  final String _deliveryId = Get.arguments as String;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    delivery = Delivery().obs;
    deliveries=RxList.empty();
    init();
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
      final deliveryResult =
      await DeliveryRepository.getDeliveryById(deliveryId: _deliveryId);
      /*if (deliveryResult?.isNotEmpty) {
        deliveries.addAll(deliveryResult);
      }*/

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
                          imgName: delivery.value.image ?? "");
                      await DeliveryRepository.deleteDelivery(
                          deliveryId: _deliveryId);

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
    Get.to(
      DeliveryEditScreen(),
      arguments: _deliveryId
    );
  }
}
