import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/extensions/validator.dart';
import '../../../utils/state/custom_state.dart';
import 'delivery_add_new_controller.dart';

class DeliveryAddNewScreen extends CustomState {
  const DeliveryAddNewScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final DeliveryAddNewController controller =
        Get.put(DeliveryAddNewController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Delivery",
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
                // - - - - - - - - - - - - - - - - - - Delivery IMAGE TITLE - - - - - - - - - - - - - - - - - -  //
                Text("Delivery Man Image",
                    style: Theme.of(context).textTheme.bodySmall),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - MAIN IMAGE Delivery Man - - - - - - - - - - - - - - - - - -  //
                GestureDetector(
                  onTap:controller.selectDelivreyImage,

                  child: Obx(
                    () => Container(
                      width: getWidth(context),
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: darkLightColor(context),
                        ),
                        color: grayColor(context),
                        borderRadius: BorderRadius.circular(
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      ),
                      child: controller.image.value != ""
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              child: Image.file(File(controller.image.value),
                                  fit: BoxFit.cover))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.image,
                                    size: 40,
                                    color: darkLightColor(context)
                                        .withOpacity(0.4)),
                                const SizedBox(
                                    height:
                                        CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                Text("Select Image (Main)",
                                    style:
                                        Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                    ),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - TITLE INFORMATION - - - - - - - - - - - - - - - - - -  //
                Text("Delivery Man Details",
                    style: Theme.of(context).textTheme.bodySmall),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - TEXT FIELD TITLE - - - - - - - - - - - - - - - - - -  //
                CustomTextField(
                    hint: "Full Name",
                    controller: controller.fullNameController,
                    leadingIcon: Iconsax.text,
                    validator: (value) =>
                        Validator.validateEmptyField("Full Name", value),
                    textInputType: TextInputType.text),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                CustomTextField(
                    hint: "phone Number",
                    controller: controller.phoneNumberController,
                    leadingIcon: Iconsax.headphone,
                    validator: (value) =>
                        Validator.validateEmptyField("phone Number", value),
                    textInputType: TextInputType.text),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                CustomTextField(
                    hint: "Location",
                    controller: controller.locationController,
                    leadingIcon: Iconsax.location,
                    validator: (value) =>
                        Validator.validateEmptyField("Location", value),
                    textInputType: TextInputType.text),

                // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                // - - - - - - - - - - - - - - - - - - BUTTON CREATE Delivery Man - - - - - - - - - - - - - - - - - -  //
                CustomElevatedButton(
                    text: "Create Delivery Man",
                    onClick: controller.onCreateDeliveryMan,
                    withDefaultPadding: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
