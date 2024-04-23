import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grocery_admin_panel/utils/local/storage/local_storage.dart';

import '../../utils/theme/theme_app.dart';

class SettingsController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxBool isLoading,
      switchBtnEnableDarkMode,
      switchBtnEnableArabicLanguage,
      switchBtnEnableFullScreen,
      switchBtnEnableImageQuality,
      switchBtnEnableHideLoginScreen;
  late final RxString error;
  late final GetStorage _storage;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    isLoading = false.obs;
    switchBtnEnableDarkMode = false.obs;
    switchBtnEnableArabicLanguage = false.obs;
    switchBtnEnableFullScreen = false.obs;
    switchBtnEnableImageQuality = false.obs;
    switchBtnEnableHideLoginScreen = false.obs;
    error = "".obs;
    _storage = GetStorage();
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {

    final darkModeSwitcher = await LocalStorage.read(key: "DARK_MODE", storage: _storage) ?? false;
    switchBtnEnableDarkMode.value = darkModeSwitcher;

    final arabicLanguageSwitcher = await LocalStorage.read(key: "ARABIC_LANGUAGE", storage: _storage) ?? false;
    switchBtnEnableArabicLanguage.value = arabicLanguageSwitcher;

    final fullScreenSwitcher = await LocalStorage.read(key: "FULL_SCREEN", storage: _storage) ?? false;
    switchBtnEnableFullScreen.value = fullScreenSwitcher;

    final imagesFHDSwitcher = await LocalStorage.read(key: "IMAGES_FHD", storage: _storage) ?? false;
    switchBtnEnableImageQuality.value = imagesFHDSwitcher;

    final hideAuthenticationSwitcher = await LocalStorage.read(key: "HIDE_AUTHENTICATION", storage: _storage) ?? false;
    switchBtnEnableHideLoginScreen.value = hideAuthenticationSwitcher;

  }

  // - - - - - - - - - - - - - - - - - - SWITCH INTO DARK MODE - - - - - - - - - - - - - - - - - -  //
  onEnableDarkTheme(bool switched) async {
    switchBtnEnableDarkMode.value = switched;
    await LocalStorage.upsert(key: "DARK_MODE", value: switched, storage: _storage);
    print("++++++++++");
    print("Theme switcher => ${switchBtnEnableDarkMode.value}");
    print("++++++++++");
    if(switchBtnEnableDarkMode.isTrue) { Get.changeTheme(ThemeApp.darkTheme); }
    if(switchBtnEnableDarkMode.isFalse) { Get.changeTheme(ThemeApp.lightTheme); }
  }

  // - - - - - - - - - - - - - - - - - - SWITCH INTO ARABIC LANGUAGE - - - - - - - - - - - - - - - - - -  //
  onEnableArabicLanguage(bool switched) async{
    await LocalStorage.upsert(key: "ARABIC_LANGUAGE", value: switched, storage: _storage);
    switchBtnEnableArabicLanguage.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - SWITCH INTO FULL SCREEN - - - - - - - - - - - - - - - - - -  //
  onEnableFullScreen(bool switched) async{
    await LocalStorage.upsert(key: "FULL_SCREEN", value: switched, storage: _storage);
    switchBtnEnableFullScreen.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - SWITCH INTO IMAGES FHD - - - - - - - - - - - - - - - - - -  //
  onEnableImageQuality(bool switched) async{
    await LocalStorage.upsert(key: "IMAGES_FHD", value: switched, storage: _storage);
    switchBtnEnableImageQuality.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - SWITCH INTO HIDE AUTHENTICATION - - - - - - - - - - - - - - - - - -  //
  onEnableHideLoginScreen(bool switched) async {
    await LocalStorage.upsert(key: "HIDE_AUTHENTICATION", value: switched, storage: _storage);
    switchBtnEnableHideLoginScreen.value = switched;
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    isLoading.close();
    error.close();
  }
}
