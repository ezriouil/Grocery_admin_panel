import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_loading.dart';
import 'package:grocery_admin_panel/data/models/product.dart';
import 'package:grocery_admin_panel/data/models/store.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_product_repository.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_store_repository.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/seller_product_detail_screen.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_outlined_button.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../seller_add_new_product_to_store/seller_add_new_product_to_store_screen.dart';
import '../seller_edit_store/seller_edit_store_screen.dart';

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
      final storeProductsResult = await SellerProductRepository.getStoreProductsById(storeId: _storeId);
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
    Get.off( () => const SellerProductDetailScreen(), arguments: productId);
  }

  // - - - - - - - - - - - - - - - - - - ON NAVIGATE ADD NEW PRODUCT  - - - - - - - - - - - - - - - - - -  //
  onNavigateAddNewProduct(){
    Get.off(()=> const SellerAddNewProductToStoreScreen(), arguments: [_storeId, store.value.title]);
  }

    // - - - - - - - - - - - - - - - - - - ON  SHARE STORE INFO  - - - - - - - - - - - - - - - - - -  //
  onShareStoreInfo() async{await Share.share("Store Name : ${store.value.title}\n\nStore Email : ${store.value.email}\n\nStore Phone : ${store.value.phoneNumber}\n\nStore Location : ${store.value.location}\n\nStore Products Count : ${storeProducts.length}");
  }

  // - - - - - - - - - - - - - - - - - - DELETE STORE - - - - - - - - - - - - - - - - - -  //
  onDeleteStore() async{
    Get.defaultDialog(
      title: "Are you sure",
      content: Row(
        children: [
          Expanded(child: CustomOutlinedButton(text: "Cancel", withDefaultPadding: false, onClick: Get.back)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Expanded(
              child: CustomElevatedButton(
                  text: "Delete",
                  withDefaultPadding: false,
                  onClick: () async {
                    try{

                      /// START LOADING
                      CustomLoading.start();

                      /// DELETE STORE WITH HIS PRODUCTS
                      for (Product product in storeProducts) {

                        await SellerProductRepository.deleteImage(imgName: "${product.id}_img1");
                        await SellerProductRepository.deleteImage(imgName: "${product.id}_img2");
                        await SellerProductRepository.deleteImage(imgName: "${product.id}_img3");
                        await SellerProductRepository.deleteProduct(productId: product.id ?? "");
                      }
                      await SellerStoreRepository.deleteImage(imgName: store.value.id ?? "");
                      await SellerStoreRepository.deleteStore(storeId: _storeId);

                      /// STOP LOADING
                      CustomLoading.stop();
                      await Future.delayed(const Duration(milliseconds: 500));
                      Get.back();

                    }
                    catch(e){
                      /// STOP LOADING
                      CustomLoading.stop();
                      error.value = e.toString();
                    }
                  })
          ),
        ],
      ),
    );
  }

  // - - - - - - - - - - - - - - - - - - EDIT STORE - - - - - - - - - - - - - - - - - -  //
  onEditStore() {
    Get.off( () => const SellerEditStoreScreen(), arguments: _storeId);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
    store.close();
  }
}
