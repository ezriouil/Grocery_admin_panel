import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/repositories/delivery_repositories/delivery_repository.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../common/widgets/custom_snackbars.dart';
import '../../../data/models/delivery.dart';
import '../../../utils/helpers/network.dart';

class DeliveryAddNewController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final GlobalKey<FormState>? formState;
  late final ImagePicker _imagePicker;

  late final RxString image;
  late final TextEditingController fullNameController,
      emailController,
      passwordController,
      phoneNumberController,
      locationController;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    formState = GlobalKey<FormState>();
    _imagePicker = ImagePicker();
    image = "".obs;
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    locationController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {}

  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM GALLERY - - - - - - - - - - - - - - - - - -  //
  selectDelivreyImage() async {
    final img = await _imagePicker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (img == null) {
      CustomSnackBars.warning(
        title: "No Image Selected",
        message: "Try again..",
      );
      return;
    }
    image.value = img.path;
  }

  // - - - - - - - - - - - - - - - - - - CREATE NEW Delivrey Man - - - - - - - - - - - - - - - - - -  //

  onCreateDeliveryMan() async {
    try {
      final bool hasNetwork = await Network.hasConnection();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      if (image.value == "") {
        CustomSnackBars.error(
            icon: Iconsax.image,
            title: "Select image",
            message: "You must select image for the store");
        return;
      }

      /// START LOADING
      CustomLoading.start();

      /// CREATE ACCOUNT WITH EMAIL AND PASSWORD
      final UserCredential userCredential =
          await DeliveryRepository.createDeliveryAuthAccount(
              email: emailController.text.trim(),
              password: passwordController.text.trim());
      if (userCredential.user == null) {
        return;
      }

      /// SAVE Delivery Man IMAGES INTO STORAGE
      final imgUrl = await DeliveryRepository.saveImage(imgName: userCredential.user!.uid, imgPath: image.value);

      /// SAVE STORE INFO INTO FIRESTORM
      final delivery = Delivery(
          id: userCredential.user?.uid,
          createAt: DateTime.now().toString(),
          location: locationController.text,
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          fullName: fullNameController.text,
          image: imgUrl,
          phoneNumber: phoneNumberController.text.trim());
      await DeliveryRepository.createNewDelivery(delivery: delivery);

      image.close();
      emailController.clear();
      passwordController.clear();
      fullNameController.clear();
      phoneNumberController.clear();
      locationController.clear();
      image.value = "";

      /// STOP LOADING
      CustomLoading.stop();

      /// STORE CREATED
      CustomSnackBars.success(
          title: "Successfully", message: "Delivery Man is added.");
    } catch (e) {
      /// STOP LOADING
      CustomLoading.stop();
      CustomSnackBars.error(
          icon: Iconsax.user_remove,
          title: "Server error",
          message: "Try next time..");
    }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
    image.close();
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    locationController.dispose();
  }
}
