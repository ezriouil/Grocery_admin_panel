import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/features/command/command_dashboard/command_details_screen.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_dashboard/delivery_dashborad_screen.dart';
import 'package:grocery_admin_panel/features/settings/settings_screen.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';
import '../seller/seller_dashboard/seller_dashborad_screen.dart';

class MainDashboardScreen extends CustomState {
  const MainDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            CustomElevatedButton(
                text: "Settings",
                onClick: () {Get.to(() => const SettingsScreen());} ),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            CustomElevatedButton(
                text: "Seller Dashboard",
                onClick: () {Get.to(() => const SellerDashboardScreen());} ),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            CustomElevatedButton(
                text: "Delivery Dashboard",
                onClick: () {Get.to(() => const DeliveryDashboardScreen());} ),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            CustomElevatedButton(
                text: "Command Dashboard",
                onClick: () {Get.to(() => const CommandDashboardScreen());} )
          ]),
    );
  }
}
