import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/store.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_store_repository.dart';
import 'package:grocery_admin_panel/features/seller/seller_store_details/seller_store_details_screen.dart';

import '../../../common/widgets/custom_loading.dart';

class SellerDashboardController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final RxList<Store> stores;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    stores = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    await getAllStores();
  }

  // - - - - - - - - - - - - - - - - - - GET ALL STORES - - - - - - - - - - - - - - - - - -  //
  Future<void> getAllStores () async{
    try {

      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      await Future.delayed(const Duration(milliseconds: 500));

      /// CREATE ALL STORES FROM FIRESTORE
      final storesResult = await SellerStoreRepository.getStores();
      stores.addAll(storesResult);

      /// STOP LOADER
      CustomLoading.stop();

    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO PRODUCTS SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToProductsScreen () async{
    /*Get.to( () => const )*/
  }
  // - - - - - - - - - - - - - - - - - - NAVIGATE TO STORE DETAIL SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToStoreDetailScreen (String storeId) async{
    Get.to( () => const SellerStoreDetailsScreen(), arguments: storeId);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
