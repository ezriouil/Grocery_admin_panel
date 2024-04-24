import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_snackbars.dart';
import 'package:grocery_admin_panel/data/models/store.dart';
import 'package:grocery_admin_panel/data/repositories/seller_repositories/seller_add_new_store_repository.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../utils/helpers/network.dart';

class SellerAddNewStoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final GlobalKey<FormState>? formState;
  late final RxBool isLoading;
  late final RxString error, imageSelectedFromGallery;
  late final ImagePicker _imagePicker;
  late final TextEditingController emailController, passwordController, titleController, descriptionController, phoneController, locationController, webSiteController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = false.obs;
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
  init () async{}

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY - - - - - - - - - - - - - - - - - -  //
  selectStoreImage () async{
     final img = await _imagePicker.pickImage(source: ImageSource.gallery);
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
      final UserCredential userCredential = await SellerAddNewStoreRepository.createStoreAuthAccount(email: emailController.text.trim(), password: passwordController.text.trim());
      if(userCredential.user == null){
        return;
      }

      /// SAVE IMAGE INTO STORAGE
      final imgUrl = await SellerAddNewStoreRepository.saveImage(imgName: userCredential.user!.uid, imgPath: imageSelectedFromGallery.value);
      final Store store = Store(
          id: userCredential.user!.uid,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          image: imgUrl,
          location: locationController.text.trim(),
          email: emailController.text.trim(),
          phoneNumber: phoneController.text.trim(),
          password: passwordController.text.trim(),
          createAt: DateTime.now().toString()
      );

      /// SAVE STORE INFO INTO FIRESTORE
      await SellerAddNewStoreRepository.createNewStore(store: store);

      /// STOP LOADING
      CustomLoading.stop();

      /// STORE CREATED
      CustomSnackBars.success(title: "Successfully", message: "store is created");

   }catch(e){

      /// STOP LOADING
      CustomLoading.stop();
      print(e.toString());
     CustomSnackBars.error(icon: Iconsax.user_remove, title: "This Email Already Used", message: "Try another email..");

   }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    isLoading.close();
    error.close();
  }
}
