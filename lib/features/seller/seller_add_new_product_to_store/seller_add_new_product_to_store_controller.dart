import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_snackbars.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../data/models/product.dart';
import '../../../data/repositories/seller_repositories/seller_product_repository.dart';
import '../../../utils/helpers/network.dart';

class SellerAddNewProductToStoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final GlobalKey<FormState>? formState;
  late final RxBool switchBtnEnableInStock;
  late final RxString error, imageSelectedFromGalleryMain,imageSelectedFromGallery1,imageSelectedFromGallery2;
  late final ImagePicker _imagePicker;
  late final TextEditingController titleController, descriptionController, oldPriceController, priceController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    _imagePicker = ImagePicker();
    switchBtnEnableInStock = true.obs;
    imageSelectedFromGalleryMain = "".obs;
    imageSelectedFromGallery1= "".obs;
    imageSelectedFromGallery2 = "".obs;
    formState = GlobalKey<FormState>();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    oldPriceController = TextEditingController();
    priceController = TextEditingController();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{}

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY (MAIN) - - - - - - - - - - - - - - - - - -  //
  selectStoreImageMain () async{
     final img = await _imagePicker.pickImage(source: ImageSource.gallery);
     if(img == null) {
       CustomSnackBars.warning(title: "No Image Selected", message: "Try again..",);
       return;
     }
     imageSelectedFromGalleryMain.value = img.path;
  }

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY (1) - - - - - - - - - - - - - - - - - -  //
  selectStoreImage1 () async{
     final img = await _imagePicker.pickImage(source: ImageSource.gallery);
     if(img == null) {
       CustomSnackBars.warning(title: "No Image Selected", message: "Try again..",);
       return;
     }
     imageSelectedFromGallery1.value = img.path;
  }

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY (2) - - - - - - - - - - - - - - - - - -  //
  selectStoreImage2 () async{
     final img = await _imagePicker.pickImage(source: ImageSource.gallery);
     if(img == null) {
       CustomSnackBars.warning(title: "No Image Selected", message: "Try again..",);
       return;
     }
     imageSelectedFromGallery2.value = img.path;
  }

  // - - - - - - - - - - - - - - - - - - SWITCH BUTTON ENABLE IN STOCK - - - - - - - - - - - - - - - - - -  //
  onEnableInStock(bool switched) async{
    switchBtnEnableInStock.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - CREATE NEW PRODUCT - - - - - - - - - - - - - - - - - -  //
  onCreateProduct() async{
    try{

      /// CHECK THE NETWORK
      final bool hasNetwork = await Network.hasConnection();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      if(imageSelectedFromGalleryMain.value == ""){
        CustomSnackBars.error(icon: Iconsax.image, title: "Select image", message: "You must select image for the store");
        return;
      }

      /// START LOADING
      CustomLoading.start();

      ///  INSTANCE FORM ID GENERATOR
      const uuid = Uuid();

      /// SAVE PRODUCT IMAGES INTO STORAGE
      final imgMainUrl = await SellerProductRepository.saveImage(imgName: uuid.v1(), imgPath: imageSelectedFromGalleryMain.value);
      final img1Url = await SellerProductRepository.saveImage(imgName: uuid.v1(), imgPath: imageSelectedFromGallery1.value);
      final img2Url = await SellerProductRepository.saveImage(imgName: uuid.v1(), imgPath: imageSelectedFromGallery2.value);

      /// SAVE STORE INFO INTO FIRESTORE
      final Product product = Product(
        id: uuid.v1(),
        idStore:  "later",
        storeName: "later",
        title: titleController.text,
        description: descriptionController.text,
        image1: imgMainUrl,
        image2:img1Url,
        image3: img2Url,
        oldPrice: int.parse(oldPriceController.text),
        price: int.parse(priceController.text),
        inStock: switchBtnEnableInStock.value
      );
      await SellerProductRepository.createNewProduct(product: product);

      /// STOP LOADING
      CustomLoading.stop();

      /// STORE CREATED
      CustomSnackBars.success(title: "Successfully", message: "Product is added.");

    }catch(e){

      /// STOP LOADING
      CustomLoading.stop();
      CustomSnackBars.error(icon: Iconsax.user_remove, title: "Server error", message: "Try next time..");

    }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    switchBtnEnableInStock.close();
    error.close();
    imageSelectedFromGalleryMain.close();
    imageSelectedFromGallery1.close();
    imageSelectedFromGallery2.close();
    titleController.dispose();
    descriptionController.dispose();
    oldPriceController.dispose();
    priceController.dispose();
  }
}