import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:grocery_admin_panel/data/repositories/delivery_repositories/delivery_repository.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_loading.dart';
import '../../../common/widgets/custom_snackbars.dart';
import '../../../utils/helpers/network.dart';

class DeliveryEditController extends GetxController {
  late final RxString error;
  late final GlobalKey<FormState>? formState;
  late final Rx<Delivery> delivery;
  late TextEditingController emailController,
      passwordController,
      fullNameController,
      phoneController,
      locationController;

  final _deliveryId = Get.arguments as String;

  @override
  void onInit() {
    error = "".obs;
    delivery = Delivery().obs;
    formState = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    phoneController = TextEditingController();
    locationController = TextEditingController();
    super.onInit();
    init();
  }

  // - - - - - - - - - - - - - - - - - - GET DELIVERY INFO - - - - - - - - - - - - - - - - - -  //
  getDeliveryInfo() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));

      /// START LOADER
      CustomLoading.start();

      /// GET STORE INFO FROM FIRESTORE
      final deliveryMan =
          await DeliveryRepository.getDeliveryById(deliveryId: _deliveryId);
      if (deliveryMan == null) {
        CustomLoading.stop();
        error.value = "Not Found";
        return;
      }
      delivery.value = deliveryMan;

      /// FiILL TEXT FIELDS
      emailController.text = deliveryMan.email ?? "";
      passwordController.text = deliveryMan.password ?? "";
      fullNameController.text = deliveryMan.fullName ?? "";
      phoneController.text = deliveryMan.phoneNumber ?? "";
      locationController.text = deliveryMan.location ?? "";

      /// STOP LOADER
      CustomLoading.stop();
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - UPDATE Delivery - - - - - - - - - - - - - - - - - -  //
  onUpdateDeliveryMan() async {
    try {
      /// CHECK THE NETWORK
      final bool hasNetwork = await Network.hasConnection();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADING
      CustomLoading.start();

      final Delivery updateDelivery = Delivery(
        id: delivery.value.id,
        fullName: fullNameController.text.trim(),
        image: delivery.value.image,
        location: locationController.text.trim(),
        email: delivery.value.email,
        phoneNumber: phoneController.text.trim(),
        password: delivery.value.password,
        createAt: delivery.value.createAt,
      );

      /// SAVE STORE INFO INTO FIRESTORE
      await DeliveryRepository.updateDelivery(delivery: updateDelivery);

      /// STOP LOADING
      CustomLoading.stop();
      await Future.delayed(const Duration(milliseconds: 500));

      /// STORE CREATED
      CustomSnackBars.success(
          title: "Successfully", message: "store is updated");
    } catch (e) {
      /// STOP LOADING
      CustomLoading.stop();
      CustomSnackBars.error(
          icon: Iconsax.user_remove,
          title: "This Email Already Used",
          message: "Try another email..");
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  init() async {
    await getDeliveryInfo();
  }
}
