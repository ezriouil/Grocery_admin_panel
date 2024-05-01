import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/common/widgets/custom_outlined_button.dart';
import 'package:grocery_admin_panel/data/models/product.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_product_repository.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/widgets/custom_loading.dart';

class SellerProductDetailController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  final _productId = Get.arguments as String;
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
  onShareProductsInfo () async{
    await Share.share("Name : ${product.value.title}\nPrice : ${product.value.price} MAD\nIn Stock : ${product.value.inStock}");
  }

  // - - - - - - - - - - - - - - - - - - BUTTON ACCEPT ( PERMISSION = TRUE) - - - - - - - - - - - - - - - - - -  //
  onAcceptProduct() async{
    try{

      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADING
      CustomLoading.start();

      /// GET PRODUCT INFO
      final Product newProduct = Product(
        id: product.value.id,
        idStore: product.value.idStore,
        title: product.value.title,
        storeName: product.value.storeName,
        description: product.value.description,
        image1: product.value.image1,
        image2: product.value.image2,
        image3: product.value.image3,
        oldPrice: product.value.oldPrice,
        price: product.value.price,
        inStock: product.value.inStock,
        hasPermission: true
      );
      await SellerProductRepository.updateProduct(product: newProduct);

      /// STOP LOADING
      CustomLoading.stop();
      await Future.delayed(const Duration(milliseconds: 500));
      Get.back();

    }catch(e){
      /// STOP LOADING
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - BUTTON REJECT ( PERMISSION = FALSE) - - - - - - - - - - - - - - - - - -  //
  onRejectProduct() async{
    try{

      /// START LOADING
      CustomLoading.start();

      await SellerProductRepository.deleteImage(imgName: "${product.value.image1!}_img1");
      await SellerProductRepository.deleteImage(imgName: "${product.value.image2!}_img2");
      await SellerProductRepository.deleteImage(imgName: "${product.value.image3!}_img3");
      await SellerProductRepository.deleteProduct(productId: _productId);

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
  }

  // - - - - - - - - - - - - - - - - - - DELETE PRODUCT - - - - - - - - - - - - - - - - - -  //
  onDeleteProduct(){
    Get.defaultDialog(
      title: "Are you sure",
      content: Row(
        children: [
          Expanded(child: CustomOutlinedButton(text: "Cancel", withDefaultPadding: false, onClick: Get.back)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Expanded(child: CustomElevatedButton(text: "Delete", withDefaultPadding: false, onClick: ()async{
            await onRejectProduct();
            Get.back();
          })),
        ],
      ),
    );
  }

  // - - - - - - - - - - - - - - - - - - EDIT PRODUCT - - - - - - - - - - - - - - - - - -  //
  onEditProduct() async{

  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
