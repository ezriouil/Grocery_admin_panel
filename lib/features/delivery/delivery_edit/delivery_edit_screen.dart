import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_edit/delivery_edit_controller.dart';
import 'package:grocery_admin_panel/utils/extensions/validator.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../utils/constants/custom_sizes.dart';

class DeliveryEditScreen extends CustomState {
  @override
  Widget execute(BuildContext context) {
    final DeliveryEditController controller = Get.put(DeliveryEditController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Edit",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Obx(() => controller.error.value != ""
              ? Center(child: Text(controller.error.value))
              : Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // - - - - - - - - - - - - - - - - - - AUTHENTICATION TITLE - - - - - - - - - - - - - - - - - -  //
                      Text("Authentication",
                          style: Theme.of(context).textTheme.bodySmall),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD EMAIL - - - - - - - - - - - - - - - - - -  //
                      CustomTextField(
                          hint: "Email",
                          controller: controller.emailController,
                          leadingIcon: Iconsax.direct_right,
                          validator: (value) =>
                              Validator.validateEmailField(value),
                          textInputType: TextInputType.emailAddress,
                          readOnly: true),

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD PASSWORD - - - - - - - - - - - - - - - - - -  //
                      CustomTextField(
                          hint: "Password",
                          controller: controller.passwordController,
                          leadingIcon: Iconsax.password_check,
                          validator: (value) =>
                              Validator.validatePasswordField(value),
                          textInputType: TextInputType.visiblePassword,
                          readOnly: true),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - TITLE INFORMATION - - - - - - - - - - - - - - - - - -  //
                      Text("Information",
                          style: Theme.of(context).textTheme.bodySmall),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD TITLE - - - - - - - - - - - - - - - - - -  //
                      CustomTextField(
                          hint: "Full Name",
                          controller: controller.fullNameController,
                          leadingIcon: Iconsax.text,
                          validator: (value) =>
                              Validator.validateEmptyField("Title", value),
                          textInputType: TextInputType.text),

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD PHONE - - - - - - - - - - - - - - - - - -  //
                      CustomTextField(
                          hint: "Phone",
                          controller: controller.phoneController,
                          leadingIcon: Iconsax.call,
                          validator: (value) =>
                              Validator.validateEmptyField("Phone", value),
                          textInputType: TextInputType.phone),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - Location TITLE - - - - - - - - - - - - - - - - - -  //
                      Text("Location",
                          style: Theme.of(context).textTheme.bodySmall),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(
                          height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                      // - - - - - - - - - - - - - - - - - - LOCATION - - - - - - - - - - - - - - - - - -  //
                      CustomTextField(
                          hint: "Location",
                          controller: controller.locationController,
                          leadingIcon: Iconsax.location,
                          validator: (value) =>
                              Validator.validateEmptyField("Location", value),
                          textInputType: TextInputType.text),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                      // - - - - - - - - - - - - - - - - - - BUTTON CREATE STORE - - - - - - - - - - - - - - - - - -  //
                      CustomElevatedButton(
                          text: "Update Delivery",
                          onClick: controller.onUpdateDeliveryMan,
                          withDefaultPadding: false)
                    ],
                  ),
                )),
        ),
      ),
    );
  }
}
