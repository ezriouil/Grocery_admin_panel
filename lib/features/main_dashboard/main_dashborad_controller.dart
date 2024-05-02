import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/command/command_dashboard/command_details_screen.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_dashboard/delivery_dashborad_screen.dart';
import 'package:grocery_admin_panel/features/seller/seller_dashboard/seller_dashborad_screen.dart';
import 'package:grocery_admin_panel/features/settings/settings_screen.dart';
import 'package:grocery_admin_panel/utils/theme/theme_app.dart';

class MainDashboardController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init () async{}

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO STORE SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToStoreScreen(){ Get.to( ()=> const SellerDashboardScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO COMMANDS SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToCommandScreen(){ Get.to( ()=> const CommandDashboardScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO DELIVERY SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToDeliveryScreen(){ Get.to( ()=> const DeliveryDashboardScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO SETTINGS SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToSettingsScreen(){ Get.to( ()=> const SettingsScreen() ); }

  // - - - - - - - - - - - - - - - - - - ENABLE DARK THEME - - - - - - - - - - - - - - - - - -  //
  onEnableDarkTheme(){
    Get.isDarkMode ? Get.changeTheme(ThemeApp.lightTheme) : Get.changeTheme(ThemeApp.darkTheme);
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
