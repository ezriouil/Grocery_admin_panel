import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_admin_panel/common/widgets/custom_snackbars.dart';
import 'package:grocery_admin_panel/data/repositories/auth_repositories/login_repository.dart';
import 'package:grocery_admin_panel/utils/helpers/network.dart';
import 'package:grocery_admin_panel/utils/local/storage/local_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../main_dashboard/main_dashborad_screen.dart';

class LoginController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState>? formState;
  late final RxBool passwordObscure, checkbox, isLoading;
  late final GetStorage _storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _storage = GetStorage();
    checkbox = true.obs;
    isLoading = false.obs;
    passwordObscure = true.obs;
    formState = GlobalKey<FormState>();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{
    emailController.text = await LocalStorage.read(key: "EMAIL", storage: _storage) ?? "";
    passwordController.text =  await LocalStorage.read(key: "PASSWORD", storage: _storage) ?? "";
  }

  // - - - - - - - - - - - - - - - - - - CREATE ACCOUNT BY EMAIL AND PASSWORD - - - - - - - - - - - - - - - - - -  //
  Future<void> onLogin() async {

    try {

      /// CHECK THE NETWORK
      final bool hasNetwork = await _checkTheNetwork();
      if (!hasNetwork) return;

      /// CHECK FROM VALIDATION
      if (!formState!.currentState!.validate()) return;

      /// START LOADER
      isLoading.value = true;

      /// CREATE USER ACCOUNT
      final userCredential = await LoginRepository.loginWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      if(userCredential?.user == null) return;

      /// SAVE INTO LOCAL STORAGE
      if(checkbox.isTrue){
        await LocalStorage.upsert(key: "EMAIL", value: emailController.text.trim(), storage: _storage);
        await LocalStorage.upsert(key: "PASSWORD", value: passwordController.text.trim(), storage: _storage);
      }

      /// STOP THE LOADER
      isLoading.value = false;

      /// NAVIGATE TO MAIN DASHBOARD SCREEN
      Get.off( () => const MainDashboardScreen());

    } catch (error) {
      isLoading.value = false;
      CustomSnackBars.error(title: "Error 404", message: error.toString());
    }
  }

  // - - - - - - - - - - - - - - - - - - CHECK THE NETWORK - - - - - - - - - - - - - - - - - -  //
  Future<bool> _checkTheNetwork() async {
    final hasNetwork = await Network.hasConnection();
    if (!hasNetwork) {
      CustomSnackBars.error(
          icon: Iconsax.wifi,
          title: "No internet connection",
          message: "please check your network device.");
      return false;
    }
    return true;
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    formState = null;
    checkbox.close();
    passwordObscure.close();
  }
}
