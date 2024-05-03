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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal : CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        child: SingleChildScrollView(
          child: Column(children: [

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

            // - - - - - - - - - - - - - - - - - - STORES + PRODUCTS - - - - - - - - - - - - - - - - - -  //
            Row(
              children: [
                Expanded(child: CustomMainDashboardCard(title: "Stores", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.shop, onClick: controller.onNavigateToStoreScreen)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                Expanded(child: CustomMainDashboardCard(title: "Commands", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.activity, onClick: controller.onNavigateToCommandScreen)),
              ],
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - - COMMANDS + DELIVERIES - - - - - - - - - - - - - - - - - -  //
            Row(
              children: [
                Expanded(child: CustomMainDashboardCard(title: "Deliveries", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.truck, onClick: controller.onNavigateToDeliveryScreen)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                Expanded(child: CustomMainDashboardCard(title: "Settings", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.setting, onClick: controller.onNavigateToSettingsScreen)),
              ],
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),

            // - - - - - - - - - - - - - - - - - -  VERSION  - - - - - - - - - - - - - - - - - -  //
            Center(child: Text("version 1.0.0", style: Theme.of(context).textTheme.bodySmall)),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            ]),
        ),
      ),
    );
  }
}