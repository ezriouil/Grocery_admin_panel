import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/settings/settings_controller.dart';
import 'package:grocery_admin_panel/features/settings/widgets/custom_settings_tile.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import '../../utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends CustomState {
  const SettingsScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      appBar: AppBar(
        title:
            Text("Settings", style: Theme.of(context).textTheme.headlineSmall),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

          // - - - - - - - - - - - - - - - - - -  Display - - - - - - - - - - - - - - - - - -  //
          Text("Display", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: grayColor(context), letterSpacing: 0.6)),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

          // - - - - - - - - - - - - - - - - - - DARK MODE - - - - - - - - - - - - - - - - - -  //
          Obx(
            ()=> CustomSettingTile(
              title: "Dark Mode",
              subTitle: "Enjoy the new theme design for you ...",
              icon: Iconsax.colorfilter,
              trailing: Switch(
                  value: controller.switchBtnEnableDarkMode.value,
                  onChanged: controller.onEnableDarkTheme),
            ),
          ),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

          // - - - - - - - - - - - - - - - - - - LANGUAGE - - - - - - - - - - - - - - - - - -  //
          Obx(()=> CustomSettingTile(
              title: "Arabic Language",
              subTitle: "Enjoy the new theme design for you ...",
              icon: Iconsax.language_square,
              trailing: Switch(
                  value: controller.switchBtnEnableArabicLanguage.value,
                  onChanged: controller.onEnableArabicLanguage),
            ),
          ),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

          // - - - - - - - - - - - - - - - - - - FULL SCREEN - - - - - - - - - - - - - - - - - -  //
          Obx( ()=> CustomSettingTile(
              title: "Full Screen",
              subTitle: "Enjoy the new theme design for you ...",
              icon: Iconsax.mirroring_screen,
              trailing: Switch(
                  value: controller.switchBtnEnableFullScreen.value,
                  onChanged: controller.onEnableFullScreen),
            ),
          ),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

          // - - - - - - - - - - - - - - - - - - IMAGES FHD - - - - - - - - - - - - - - - - - -  //
          Obx( ()=> CustomSettingTile(
              title: "Images FHD",
              subTitle: "Enjoy the new theme design for you ...",
              icon: Iconsax.image,
              trailing: Switch(
                  value: controller.switchBtnEnableImageQuality.value,
                  onChanged: controller.onEnableImageQuality),
            ),
          ),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

          // - - - - - - - - - - - - - - - - - - HIDE AUTHENTICATION - - - - - - - - - - - - - - - - - -  //
          Obx( ()=> CustomSettingTile(
              title: "Hide Authentication",
              subTitle: "Enjoy the new theme design for you ...",
              icon: Iconsax.security_safe,
              trailing: Switch(
                  value: controller.switchBtnEnableHideLoginScreen.value,
                  onChanged: controller.onEnableHideLoginScreen),
            ),
          ),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

          // - - - - - - - - - - - - - - - - - -  OTHERS - - - - - - - - - - - - - - - - - -  //
          Text("Others", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: grayColor(context), letterSpacing: 0.6)),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

          // - - - - - - - - - - - - - - - - - - PRIVACY AND SECURITY - - - - - - - - - - - - - - - - - -  //
          CustomSettingTile(
            title: "Privacy And Security",
            subTitle: "Enjoy the new theme design for you ...",
            icon: Iconsax.lock,
            trailing: Icon(Iconsax.arrow_right_3,size: 32, color: darkLightColor(context))),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

          // - - - - - - - - - - - - - - - - - - HELP AND SUPPORT - - - - - - - - - - - - - - - - - -  //
          CustomSettingTile(
            title: "Help And Support",
            subTitle: "Enjoy the new theme design for you ...",
            icon: Iconsax.headphone5,
            trailing: Icon(Iconsax.arrow_right_3,size: 32, color: darkLightColor(context))),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

          // - - - - - - - - - - - - - - - - - - ABOUT - - - - - - - - - - - - - - - - - -  //
          CustomSettingTile(
            title: "About",
            subTitle: "Enjoy the new theme design for you ...",
            icon: Iconsax.info_circle,
            trailing: Icon(Iconsax.arrow_right_3,size: 32, color: darkLightColor(context))),

          // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS*2),

          // - - - - - - - - - - - - - - - - - -  VERSION  - - - - - - - - - - - - - - - - - -  //
          Center(child: Text("version 1.0.0", style: Theme.of(context).textTheme.bodySmall)),

        ]),

      )),
    );
  }
}
