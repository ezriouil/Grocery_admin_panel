import 'dart:developer';

import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:grocery_admin_panel/data/repositories/delivery_repositories/delivery_repository.dart';

import '../../../common/widgets/custom_loading.dart';

class DeliveryDetailsController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final Rx<Delivery> delivery;
  final String _deliveryId = Get.arguments as String;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    delivery = Delivery().obs;
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

      /// STOP LOADER
      CustomLoading.stop();
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    print(getDeliveryInfo());
    getDeliveryInfo();
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
