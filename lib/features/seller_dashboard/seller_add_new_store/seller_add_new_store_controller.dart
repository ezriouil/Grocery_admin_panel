import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_snackbars.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helpers/network.dart';

class SellerAddNewStoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final GlobalKey<FormState>? formState;
  late final RxBool isLoading;
  late final RxString error, imageSelectedFromGallery;
  late final ImagePicker _imagePicker;
  late final TextEditingController emailController, passwordController, titleController, descriptionController, phoneController, locationController, managerController, webSiteController;

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
    managerController = TextEditingController();
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

    /// CHECK THE NETWORK
    final bool hasNetwork = await Network.hasConnection();
    if (!hasNetwork) return;

    /// CHECK FROM VALIDATION
    if (!formState!.currentState!.validate()) return;

  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    isLoading.close();
    error.close();
  }
}
