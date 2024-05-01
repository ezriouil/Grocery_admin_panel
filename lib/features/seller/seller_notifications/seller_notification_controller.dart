import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_product_repository.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../data/models/product.dart';
import '../seller_product_details/seller_product_detail_screen.dart';

class SellerNotificationController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxList<Product> storeProducts;
  late final RxString error;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    storeProducts = RxList.empty();
    error = "".obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    await getProducts();
  }

  // - - - - - - - - - - - - - - - - - - GET ALL PRODUCTS WITH NO PERMISSION - - - - - - - - - - - - - - - - - -  //
  getProducts() async  {
    try{

      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      await Future.delayed(const Duration(milliseconds: 1000));

      final productsResult = await SellerProductRepository.getStoreProductWithNoPermission();
      if(productsResult.isEmpty){
        CustomLoading.stop();
        return;
      }
      storeProducts.addAll(productsResult);

      /// STOP LOADER
      CustomLoading.stop();

    }catch(e){
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE PRODUCT INFO - - - - - - - - - - - - - - - - - -  //
  onNavigateProductDetail(String productId){
    Get.off( () => const SellerProductDetailScreen(), arguments: productId);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    storeProducts.close();
    error.close();
  }
}
