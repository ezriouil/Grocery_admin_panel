import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/repositories/delivery_repositories/delivery_repository.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_details/delivery_details_controller.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_details/delivery_details_screen.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../data/models/delivery.dart';

class DeliveryDashboardController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late  RxList<Delivery> deliveries;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    deliveries = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    getAllDeliveries();
  }

  // - - - - - - - - - - - - - - - - - - GET ALL deliveries Man - - - - - - - - - - - - - - - - - -  //
  Future<void> getAllDeliveries() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      await Future.delayed(const Duration(milliseconds: 500));

      /// CREATE ALL DELIVERY MEN FROM FIRESTORM
      final storesResult = await DeliveryRepository.getDeliveries();
      deliveries.value=storesResult;
      print(deliveries);
      /// STOP LOADER
      CustomLoading.stop();
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }
  onNavigateToDeliveryDetailsScreen (String storeId) async {
    Get.to( () => const DeliveryDetailsScreen(), arguments: storeId);
  }
  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
