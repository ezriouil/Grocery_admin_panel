import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_loading.dart';
import 'package:grocery_admin_panel/data/models/product.dart';
import 'package:grocery_admin_panel/data/models/store.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_product_repository.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_store_repository.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/seller_product_detail_screen.dart';

class SellerStoreDetailsController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final Rx<Store> store;
  late final RxList<Product> storeProducts;
  final _storeId = Get.arguments as String;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    store = Store().obs;
    storeProducts = RxList.empty();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    await getStoreInfo();
  }

  // - - - - - - - - - - - - - - - - - - GET STORE INFO - - - - - - - - - - - - - - - - - -  //
  getStoreInfo() async{
    try{

      await Future.delayed(const  Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      /// GET STORE INFO FROM FIRESTORE
      final storeResult = await SellerStoreRepository.getStoreById(storeId: _storeId);
      if(storeResult == null){
        CustomLoading.stop();
        error.value = "Not Found";
        return;
      }
      store.value = storeResult;

      /// GET PRODUCTS OF THE STORE
      final storeProductsResult = await SellerProductRepository.getStoreProductsById(id: _storeId);
      if(storeProductsResult.isNotEmpty){
        storeProducts.addAll(storeProductsResult);
      }

      /// STOP LOADER
     CustomLoading.stop();

    }catch(e){
      CustomLoading.stop();
      error.value = e.toString();
    }

  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE PRODUCT INFO - - - - - - - - - - - - - - - - - -  //
  onNavigateProductDetail(String productId){
    Get.to( () => const SellerProductDetailScreen(), arguments: productId);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
    store.close();
  }
}
