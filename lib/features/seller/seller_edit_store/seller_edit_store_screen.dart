import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/seller/seller_edit_store/seller_edit_store_controller.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/extensions/validator.dart';

class SellerEditStoreScreen extends CustomState {
  const SellerEditStoreScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerEditStoreController controller = Get.put(SellerEditStoreController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Update Store",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Obx( ()=> controller.error.value != "" ?
          Center(child: Text(controller.error.value)) :
          Form(
            key: controller.formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // - - - - - - - - - - - - - - - - - - AUTHENTICATION TITLE - - - - - - - - - - - - - - - - - -  //
                Text("Authentication", style: Theme.of(context).textTheme.bodySmall),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD EMAIL - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Email", controller: controller.emailController, leadingIcon: Iconsax.direct_right, validator: (value) => Validator.validateEmailField(value), textInputType: TextInputType.emailAddress, readOnly: true),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD PASSWORD - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Password", controller: controller.passwordController, leadingIcon: Iconsax.password_check, validator: (value) => Validator.validatePasswordField(value), textInputType: TextInputType.visiblePassword, readOnly: true),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - TITLE INFORMATION - - - - - - - - - - - - - - - - - -  //
                Text("Information", style: Theme.of(context).textTheme.bodySmall),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD TITLE - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Title", controller: controller.titleController, leadingIcon: Iconsax.text, validator: (value) => Validator.validateEmptyField("Title", value), textInputType: TextInputType.text),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD DESCRIPTION - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Description", controller: controller.descriptionController, leadingIcon: Iconsax.textalign_left, validator: (value) => Validator.validateEmptyField("Description", value), textInputType: TextInputType.text),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD PHONE - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Phone", controller: controller.phoneController, leadingIcon: Iconsax.call, validator: (value) => Validator.validateEmptyField("Phone", value), textInputType: TextInputType.phone),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - DETAILS TITLE - - - - - - - - - - - - - - - - - -  //
                Text("Details", style: Theme.of(context).textTheme.bodySmall),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - LOCATION - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Location", controller: controller.locationController, leadingIcon: Iconsax.location, validator: (value) => Validator.validateEmptyField("Location", value), textInputType: TextInputType.text),

                // - - - - - - - - - - - - - - - - - - WEBSITE - - - - - - - - - - - - - - - - - -  //
                CustomTextField(hint: "Website", controller: controller.webSiteController, leadingIcon: Iconsax.shop, validator: (value) => Validator.validateEmptyField("Website", value), textInputType: TextInputType.text),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - BUTTON CREATE STORE - - - - - - - - - - - - - - - - - -  //
                CustomElevatedButton(text: "Update Store", onClick: controller.onUpdateStore, withDefaultPadding: false)
              ],
            ),
          )
          ),
        )
    );
  }
}
