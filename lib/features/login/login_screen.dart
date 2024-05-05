import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/common/widgets/custom_text_field.dart';
import 'package:grocery_admin_panel/utils/constants/custom_colors.dart';
import 'package:grocery_admin_panel/utils/constants/custom_icon_strings.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:grocery_admin_panel/utils/extensions/validator.dart';
import '../../utils/state/custom_state.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'login_controller.dart';

class LoginScreen extends CustomState {
  const LoginScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INSTANCE FROM THE CONTROLLER - - - - - - - - - - - - - - - - - -  //
    final LoginController controller = Get.put(LoginController());

    // - - - - - - - - - - - - - - - - - - CHANGE THEME OF TOP STATUS BAR AND SYSTEM BOTTOM BAR - - - - - - - - - - - - - - - - - -  //
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:  isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      statusBarIconBrightness: isDark(context) ? Brightness.light : Brightness.dark,
      statusBarBrightness:  isDark(context) ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      systemNavigationBarIconBrightness: isDark(context) ? Brightness.light : Brightness.dark,
    ));

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            horizontal: CustomSizes.SPACE_DEFAULT,
            vertical: CustomSizes.SPACE_BETWEEN_SECTIONS * 2),
        child: Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // - - - - - - - - - - - - - - - - - - LOGO - - - - - - - - - - - - - - - - - -  //
                Image.asset(CustomIconStrings.APP_LOGO, height: 100, color: darkLightColor(context)),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                Text("Welcome back,", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - SUBTITLE - - - - - - - - - - - - - - - - - -  //
                Text("Discover Limitless Choices and Unmatched Convenience.. ", style: Theme.of(context).textTheme.bodyMedium),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - EMAIL - - - - - - - - - - - - - - - - - -  //
                CustomTextField(
                    leadingIcon: Iconsax.direct_right,
                    hint: "Email",
                    controller: controller.emailController,
                    validator: (value) => Validator.validateEmailField(value),
                    textInputType: TextInputType.emailAddress),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                // - - - - - - - - - - - - - - - - - - PASSWORD - - - - - - - - - - - - - - - - - -  //
                Obx(
                  () => CustomTextField(
                    leadingIcon: Iconsax.password_check,
                    controller: controller.passwordController,
                    validator: (value) => Validator.validatePasswordField(value),
                    hint: "Password",
                    textInputType: TextInputType.visiblePassword,
                    obscureText: controller.passwordObscure.value,
                    trailingIcon: InkWell(
                      onTap: () => {
                        controller.passwordObscure.value = !controller.passwordObscure.value
                      },
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
                      child: Icon(
                          controller.passwordObscure.value ? Iconsax.eye_slash : Iconsax.eye,
                          color: grayColor(context)),
                    ),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - CHECKBOX - - - - - - - - - - - - - - - - - -  //
                Row(
                    children: [
                  Obx(
                    () => Checkbox(
                      visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
                        value: controller.checkbox.value,
                        onChanged: (value) => { controller.checkbox.value = !controller.checkbox.value }),
                  ),
                  Text("Remember me", style: Theme.of(context).textTheme.bodySmall),
                ]
                ),

                // - - - - - - - - - - - - - - - - - - BUTTON - - - - - - - - - - - - - - - - - -  //
                CustomElevatedButton(
                  text: "Login",
                  onClick: controller.onLogin,
                  width: getWidth(context),
                  withDefaultPadding: false,
                ),
              ],
            )),
      ),
    );
  }
}
