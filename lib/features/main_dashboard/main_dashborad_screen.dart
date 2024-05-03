import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/main_dashboard/main_dashborad_controller.dart';
import 'package:grocery_admin_panel/features/main_dashboard/widgets/custom_main_dashboard_card.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/state/custom_state.dart';

class MainDashboardScreen extends CustomState {
  const MainDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final MainDashboardController controller = Get.put(MainDashboardController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Dashboard", style: Theme.of(context).textTheme.labelMedium),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: InkWell(
                onTap: controller.onEnableDarkTheme,
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
                child: Icon(context.isDarkMode ? Iconsax.sun_1 : Iconsax.moon, color: darkLightColor(context)),
              ),
            ),
          ]
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal : CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        child: Column(
            crossAxisAlignment : CrossAxisAlignment.start,
            children: [
          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

          // - - - - - - - - - - - - - - - - - - STORES + PRODUCTS - - - - - - - - - - - - - - - - - -  //
          Row(
            children: [
              Expanded(child: CustomMainDashboardCard(title: "Stores", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.shop, onClick: controller.onNavigateToStoreScreen)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              Expanded(child: CustomMainDashboardCard(title: "Notifications", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.notification, onClick: controller.onNavigateToNotificationScreen)),
            ],
          ),

          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          // - - - - - - - - - - - - - - - - - - STORES + PRODUCTS - - - - - - - - - - - - - - - - - -  //
          Row(
            children: [
              Expanded(
                  child: CustomMainDashboardCard(
                      title: "Deliveries",
                      subTitle:
                          "Here You Can Manage Your Stores & Adding new Stores ",
                      icon: Iconsax.shop,
                      onClick: controller.onNavigateToDeliveryScreen)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              Expanded(
                  child: CustomMainDashboardCard(
                      title: "Commands",
                      subTitle:
                          "Here You Can Manage Your Stores & Adding new Stores ",
                      icon: Iconsax.activity,
                      onClick: controller.onNavigateToCommandScreen)),
            ],
          ),

          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

          // - - - - - - - - - - - - - - - - - - COMMANDS + DELIVERIES - - - - - - - - - - - - - - - - - -  //
          Row(
            children: [


              Expanded(
                  child: CustomMainDashboardCard(
                      title: "Settings",
                      subTitle:
                          "Here You Can Manage Your Stores & Adding new Stores ",
                      icon: Iconsax.setting,
                      onClick: controller.onNavigateToSettingsScreen)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              Expanded(
                  child: CustomMainDashboardCard(
                      title: "Exit",
                      subTitle:
                      "Here You Can Manage Your Stores & Adding new Stores ",
                      icon: Iconsax.close_square,
                      onClick: controller.onExit)),
            ],
          ),

          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

          // - - - - - - - - - - - - - - - - - -  VERSION  - - - - - - - - - - - - - - - - - -  //
          Center(
              child: Text("version 1.0.0",
                  style: Theme.of(context).textTheme.bodySmall)),

          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
        ]),
      ),
    );
  }
}