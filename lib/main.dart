import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_admin_panel/features/login/login_screen.dart';
import 'package:grocery_admin_panel/features/main_dashboard/main_dashborad_screen.dart';
import 'package:grocery_admin_panel/firebase_options.dart';

import 'utils/local/storage/local_storage.dart';
import 'utils/theme/theme_app.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GetStorage.init();
  final GetStorage storage = GetStorage();
  final darkMode = await LocalStorage.read(key: "DARK_MODE", storage: storage) ?? false;
  final hideAuthentication = await LocalStorage.read(key: "HIDE_AUTHENTICATION", storage: storage) ?? false;
  //final arabicLanguage = await LocalStorage.read(key: "ARABIC_LANGUAGE", storage: storage) ?? false;
  final fullScreen = await LocalStorage.read(key: "FULL_SCREEN", storage: storage) ?? false;
  if(fullScreen) SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  FlutterNativeSplash.remove();

  runApp(GetMaterialApp(
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: RootBinding(),
      home: hideAuthentication ? const MainDashboardScreen() : const LoginScreen()));
}


/* ------ INJECT DEPENDENCIES ------ */
class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(Connectivity());

  }
}

//flutter pub run flutter_native_splash:remove
//flutter pub run flutter_native_splash:create --path=flutter_native_splash.yaml