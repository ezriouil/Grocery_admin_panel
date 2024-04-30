import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class SellerProductDetailController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late CarouselController pageController;
  late RxInt currentPageIndex;
  final productId = Get.arguments[0] as String;
  final storeName = Get.arguments[1] as String;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    pageController = CarouselController();
    currentPageIndex = 0.obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{}

  // - - - - - - - - - - - - - - - - - - SHARE PRODUCTS INFO - - - - - - - - - - - - - - - - - -  //
  onShareProductsInfo () async{}

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
