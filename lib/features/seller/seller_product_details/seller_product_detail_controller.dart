import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/product.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_product_repository.dart';

import '../../../common/widgets/custom_loading.dart';

class SellerProductDetailController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  final _productId = Get.arguments[0] as String;
  final _storeName = Get.arguments[1] as String;
  late final RxString error;
  late CarouselController pageController;
  late RxInt currentPageIndex;
  late final Rx<Product> product;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    pageController = CarouselController();
    currentPageIndex = 0.obs;
    product = Product().obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    getProductInfo();
  }

  // - - - - - - - - - - - - - - - - - - GET PRODUCT INFO FROM FIRESTORE - - - - - - - - - - - - - - - - - -  //
  getProductInfo () async{
    try{

      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADING
      CustomLoading.start();

      /// GET PRODUCT INFO
      final Product? productResult = await SellerProductRepository.getProductById(productId: _productId);
      if(productResult == null){
        CustomLoading.stop();
        return;
      }

      product.value = productResult;

      /// STOP LOADING
      CustomLoading.stop();
    }catch(e){
      /// STOP LOADING
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

// - - - - - - - - - - - - - - - - - - SHARE PRODUCTS INFO - - - - - - - - - - - - - - - - - -  //
  onShareProductsInfo () async{}

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
