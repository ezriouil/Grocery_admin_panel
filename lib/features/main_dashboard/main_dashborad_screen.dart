import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/main_dashboard/main_dashborad_controller.dart';
import 'package:grocery_admin_panel/features/main_dashboard/widgets/custom_main_dashboard_card.dart';
import 'package:grocery_admin_panel/utils/constants/custom_colors.dart';
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
        padding: const EdgeInsets.symmetric(horizontal : CustomSizes.SPACE_BETWEEN_ITEMS / 3),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

                // - - - - - - - - - - - - - - - - - - IMG + TITLE + SUBTITLE - - - - - - - - - - - - - - - - - -  //
                Row(
                  children: [

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),

                    Container(width: 50, height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS), border: Border.all(color: darkLightColor(context)), color: darkDarkLightLightColor(context)),
                        child: Icon(Iconsax.user, color: darkLightColor(context))
                    ),

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mohamed Ezriouil", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),
                        Text("welcome back,", style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),

                  ],
                ),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                // - - - - - - - - - - - - - - - - - - STORES + COMMANDS - - - - - - - - - - - - - - - - - -  //
                Row(
                  children: [
                    Expanded(
                    child: CustomMainDashboardCard(
                        title: "Stores",
                        subTitle:
                            "Here You Can Manage Your Stores & Adding new Stores ",
                        icon: Iconsax.shop,
                        onClick: controller.onNavigateToStoreScreen)),
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

                // - - - - - - - - - - - - - - - - - -  DELIVERIES + DELIVERIES - - - - - - - - - - - - - - - - - -  //
          Row(
              children: [
                Expanded(child: CustomMainDashboardCard(title: "Deliveries", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.truck, onClick: controller.onNavigateToDeliveryScreen)),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                Expanded(child: CustomMainDashboardCard(title: "Settings", subTitle: "Here You Can Manage Your Stores & Adding new Stores ", icon: Iconsax.setting, onClick: controller.onNavigateToSettingsScreen)),
              ],
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

            // - - - - - - - - - - - - - - - - - -  VERSION  - - - - - - - - - - - - - - - - - -  //
            Center(child: Text("version 1.0.0", style: Theme.of(context).textTheme.bodySmall)),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),

          ]),
        ),
      ),
    );
  }
}