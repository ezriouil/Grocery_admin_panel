import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../common/widgets/custom_snackbars.dart';
import '../../../data/models/store.dart';
import '../../../data/repositories/seller_repositories/seller_store_repository.dart';
import '../../../utils/helpers/network.dart';

class SellerEditStoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final GlobalKey<FormState>? formState;
  late final Rx<Store> store;
  late TextEditingController emailController,passwordController,titleController, descriptionController, phoneController, locationController, webSiteController;

  final _storeId = Get.arguments as String;


  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    store = Store().obs;
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

      /// FiILL TEXT FIELDS
      emailController.text = storeResult.email ?? "";
      passwordController.text = storeResult.password ?? "";
      titleController.text = storeResult.title ?? "";
      descriptionController.text = storeResult.description ?? "";
      phoneController.text = storeResult.phoneNumber ?? "";
      locationController.text = storeResult.location ?? "";
      webSiteController.text = storeResult.webSite ?? "";

      /// STOP LOADER
      CustomLoading.stop();

    }catch(e){
      CustomLoading.stop();
      error.value = e.toString();
    }

  }

  // - - - - - - - - - - - - - - - - - - UPDATE STORE - - - - - - - - - - - - - - - - - -  //
  onUpdateStore() async{
    try{

      /// CHECK THE NETWORK
      final bool hasNetwork = await Network.hasConnection();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADING
      CustomLoading.start();


      final Store updateStore = Store(
          id: store.value.id,
          title: titleController.text.trim(),
          description: descriptionController.text.trim(),
          image: store.value.image,
          location: locationController.text.trim(),
          email: store.value.email,
          phoneNumber: phoneController.text.trim(),
          password: store.value.password,
          createAt: store.value.createAt,
          webSite: webSiteController.text
      );

      /// SAVE STORE INFO INTO FIRESTORE
      await SellerStoreRepository.updateStore(store: updateStore);

      /// STOP LOADING
      CustomLoading.stop();
      await Future.delayed(const Duration(milliseconds: 500));

      /// STORE CREATED
      CustomSnackBars.success(title: "Successfully", message: "store is updated");

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
