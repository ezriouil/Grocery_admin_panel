import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_snackbars.dart';
import 'package:grocery_admin_panel/data/models/store.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_store_repository.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../utils/helpers/network.dart';

class SellerAddNewStoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final GlobalKey<FormState>? formState;
  late final RxString error, imageSelectedFromGallery;
  late final ImagePicker _imagePicker;
  late final TextEditingController emailController, passwordController, titleController, descriptionController, phoneController, locationController, webSiteController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    _imagePicker = ImagePicker();
    imageSelectedFromGallery = "".obs;
    formState = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    webSiteController = TextEditingController();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    await SellerStoreRepository.getStores();
  }

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY - - - - - - - - - - - - - - - - - -  //
  selectStoreImage () async{
     final img = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 25);
     if(img == null) {
       CustomSnackBars.warning(title: "No Image Selected", message: "Try again..",);
       return;
     }
     imageSelectedFromGallery.value = img.path;
  }

  // - - - - - - - - - - - - - - - - - - CREATE NEW STORE - - - - - - - - - - - - - - - - - -  //
  onCreateStore() async{
    try{

      /// CHECK THE NETWORK
      final bool hasNetwork = await Network.hasConnection();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      if(imageSelectedFromGallery.value == ""){
        CustomSnackBars.error(icon: Iconsax.image, title: "Select image", message: "You must select image for the store");
        return;
      }

      /// START LOADING
      CustomLoading.start();

      /// CREATE ACCOUNT WITH EMAIL AND PASSWORD
      final UserCredential userCredential = await SellerStoreRepository.createStoreAuthAccount(email: emailController.text.trim(), password: passwordController.text.trim());
      if(userCredential.user == null){
        return;
      }

      /// SAVE IMAGE INTO STORAGE
      final imgUrl = await SellerStoreRepository.saveImage(imgName: userCredential.user!.uid, imgPath: imageSelectedFromGallery.value);
      final Store store = Store(
          id: userCredential.user!.uid,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          image: imgUrl,
          location: locationController.text.trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneController.text.trim(),
          password: passwordController.text.trim(),
          webSite: webSiteController.text,
          createAt: DateTime.now().toString()
      );

      /// SAVE STORE INFO INTO FIRESTORE
      await SellerStoreRepository.createNewStore(store: store);

      /// STOP LOADING
      CustomLoading.stop();

      await Future.delayed(const Duration(milliseconds: 500));

      emailController.text = "";
      passwordController.text = "";
      titleController.text = "";
      descriptionController.text = "";
      phoneController.text = "";
      locationController.text = "";
      webSiteController.text = "";
      imageSelectedFromGallery.value = "";

      CustomSnackBars.success(title: "Successfully", message: "store is created");

   }catch(e){

      /// STOP LOADING
      CustomLoading.stop();
     CustomSnackBars.error(icon: Iconsax.user_remove, title: "This Email Already Used", message: "Try another email..");

   }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
