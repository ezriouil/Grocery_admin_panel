import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/command/command_dashboard/command_details_screen.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_dashboard/delivery_dashborad_screen.dart';
import 'package:grocery_admin_panel/features/seller/seller_dashboard/seller_dashborad_screen.dart';
import 'package:grocery_admin_panel/features/seller/seller_notifications/seller_notification_screen.dart';
import 'package:grocery_admin_panel/features/settings/settings_screen.dart';
import 'package:grocery_admin_panel/utils/theme/theme_app.dart';

import '../../common/widgets/custom_elevated_button.dart';
import '../../common/widgets/custom_outlined_button.dart';
import '../../utils/constants/custom_sizes.dart';

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

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO COMMANDS SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToNotificationScreen(){ Get.to( ()=> const SellerNotificationScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO DELIVERY SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToDeliveryScreen(){ Get.to( ()=> const DeliveryDashboardScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO SETTINGS SCREEN - - - - - - - - - - - - - - - - - -  //
  onNavigateToSettingsScreen(){ Get.to( ()=> const SettingsScreen() ); }

  // - - - - - - - - - - - - - - - - - - NAVIGATE TO MORE SCREEN - - - - - - - - - - - - - - - - - -  //
  onExit(){
    Get.defaultDialog(
      title: "Are you sure",
      content: Row(
        children: [
          Expanded(child: CustomOutlinedButton(text: "Cancel", withDefaultPadding: false, onClick: Get.back)),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          Expanded(
              child: CustomElevatedButton(
                  text: "Exit",
                  withDefaultPadding: false,
                  onClick: ()  {
                    Get.back();
                  })
          ),
        ],
      ),
    );
  }

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
