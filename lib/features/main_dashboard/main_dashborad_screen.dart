import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/features/settings/settings_screen.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';

class MainDashboardScreen extends Responsive {
  const MainDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            const Text("Main Dashboard"),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
            CustomElevatedButton(
                text: "Settings",
                onClick: () {Get.to(() => const SettingsScreen());} )
          ]),
    );
  }
}
