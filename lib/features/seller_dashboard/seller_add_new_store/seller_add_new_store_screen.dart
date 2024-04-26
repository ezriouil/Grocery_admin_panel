import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/common/widgets/custom_text_field.dart';
import 'package:grocery_admin_panel/features/seller_dashboard/seller_add_new_store/seller_add_new_store_controller.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/extensions/validator.dart';

class SellerAddNewStoreScreen extends Responsive {
  const SellerAddNewStoreScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerAddNewStoreController controller = Get.put(SellerAddNewStoreController());

    return Scaffold(
        appBar: AppBar(
          title: Text("New Store",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS),
            child: Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // - - - - - - - - - - - - - - - - - - STORE IMAGE TITLE - - - - - - - - - - - - - - - - - -  //
                  Text("Store Image", style: Theme.of(context).textTheme.bodySmall),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - SELECT IMAGE FROM DEVICE - - - - - - - - - - - - - - - - - -  //
                  InkWell(
                    onTap: controller.selectStoreImage,
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                    child: Obx(()=>Container(
                        width: getWidth(context),
                        height: 200.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: grayColor(context),
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                        ),
                        child: controller.imageSelectedFromGallery.value !=  "" ? ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.file(File(controller.imageSelectedFromGallery.value), fit: BoxFit.cover)): Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Iconsax.image, size: 40, color: darkLightColor(context).withOpacity(0.4)),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            Text("Select Image", style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                      ),
                    ),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - AUTHENTICATION TITLE - - - - - - - - - - - - - - - - - -  //
                  Text("Authentication", style: Theme.of(context).textTheme.bodySmall),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - TEXT FIELD EMAIL - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(hint: "Email", controller: controller.emailController, leadingIcon: Iconsax.direct_right, validator: (value) => Validator.validateEmailField(value), textInputType: TextInputType.emailAddress),

                  // - - - - - - - - - - - - - - - - - - TEXT FIELD PASSWORD - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(hint: "Password", controller: controller.passwordController, leadingIcon: Iconsax.password_check, validator: (value) => Validator.validatePasswordField(value), textInputType: TextInputType.visiblePassword),

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
                  CustomElevatedButton(text: "Create Store", onClick: controller.onCreateStore, withDefaultPadding: false)
                ],
              ),
            ),
          ),
        ));
  }
}
