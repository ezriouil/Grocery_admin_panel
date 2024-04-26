import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/common/widgets/custom_text_field.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/extensions/validator.dart';
import '../../settings/widgets/custom_settings_tile.dart';
import 'seller_add_new_product_to_store_controller.dart';

class SellerAddNewProductToStoreScreen extends Responsive {
  const SellerAddNewProductToStoreScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerAddNewProductToStoreController controller = Get.put(SellerAddNewProductToStoreController());

    return Scaffold(
        appBar: AppBar(
          title: Text("New Product",
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
                  Text("Product Images", style: Theme.of(context).textTheme.bodySmall),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - MAIN IMAGE PRODUCT - - - - - - - - - - - - - - - - - -  //
                  InkWell(
                    onTap: controller.selectStoreImageMain,
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                    child: Obx(()=>Container(
                      width: getWidth(context),
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        border: Border.all(color: darkLightColor(context), ),
                        color: grayColor(context),
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                      ),
                      child: controller.imageSelectedFromGalleryMain.value !=  "" ? ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.file(File(controller.imageSelectedFromGalleryMain.value), fit: BoxFit.cover)): Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.image, size: 40, color: darkLightColor(context).withOpacity(0.4)),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Text("Select Image (Main)", style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ),
                    ),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - PRODUCT OTHER IMAGES - - - - - - - - - - - - - - - - - -  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      // - - - - - - - - - - - - - - - - - - IMAGE 1 - - - - - - - - - - - - - - - - - -  //
                      Expanded(
                        child: InkWell(
                          onTap: controller.selectStoreImage1,
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Obx(()=>Container(
                            width: getWidth(context),
                            height: 120.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: darkLightColor(context), ),
                              color: grayColor(context),
                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            ),
                            child: controller.imageSelectedFromGallery1.value !=  "" ? ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.file(File(controller.imageSelectedFromGallery1.value), fit: BoxFit.cover)): Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.image, size: 40, color: darkLightColor(context).withOpacity(0.4)),
                                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                Text("Select Image 1", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                          ),
                          ),
                        ),
                      ),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_SECTIONS / 4),

                      // - - - - - - - - - - - - - - - - - - IMAGE 2 - - - - - - - - - - - - - - - - - -  //
                      Expanded(
                        child: InkWell(
                          onTap: controller.selectStoreImage2,
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                          child: Obx(()=>Container(
                            width: getWidth(context),
                            height: 120.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: darkLightColor(context)),
                              color: grayColor(context),
                              borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                            ),
                            child: controller.imageSelectedFromGallery2.value !=  "" ? ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), child: Image.file(File(controller.imageSelectedFromGallery2.value), fit: BoxFit.cover)): Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.image, size: 40, color: darkLightColor(context).withOpacity(0.4)),
                                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                Text("Select Image 2", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                          ),
                          ),
                        ),
                      ),

                    ],
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - TITLE INFORMATION - - - - - - - - - - - - - - - - - -  //
                  Text("Product Details", style: Theme.of(context).textTheme.bodySmall),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - TEXT FIELD TITLE - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(hint: "Title", controller: controller.titleController, leadingIcon: Iconsax.text, validator: (value) => Validator.validateEmptyField("Title", value), textInputType: TextInputType.text),

                  // - - - - - - - - - - - - - - - - - - TEXT FIELD DESCRIPTION - - - - - - - - - - - - - - - - - -  //
                  CustomTextField(hint: "Description", controller: controller.descriptionController, leadingIcon: Iconsax.textalign_left, validator: (value) => Validator.validateEmptyField("Description", value), textInputType: TextInputType.text),

                  // - - - - - - - - - - - - - - - - - - TEXT FIELDS ( PRICE + OLD PRICE ) - - - - - - - - - - - - - - - - - -  //
                  Row(
                    children: [

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD OLD PRICE - - - - - - - - - - - - - - - - - -  //
                      Expanded(child: CustomTextField(hint: "Old price", controller: controller.oldPriceController, leadingIcon: Iconsax.money_remove, validator: (value) => Validator.validateEmptyField("Old price", value), textInputType: TextInputType.phone)),

                      // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                      const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                      // - - - - - - - - - - - - - - - - - - TEXT FIELD NEW PRICE - - - - - - - - - - - - - - - - - -  //
                      Expanded(child: CustomTextField(hint: "Price", controller: controller.priceController, leadingIcon: Iconsax.money, validator: (value) => Validator.validateEmptyField("price", value), textInputType: TextInputType.number)),

                    ],
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - SWITCH BUTTON IN STOCK- - - - - - - - - - - - - - - - - -  //
                  Obx(
                        ()=> CustomSettingTile(
                      title: "In Stock",
                      subTitle: "If the product doesn't exist disable it  ...",
                      icon: Iconsax.verify,
                      trailing: Switch(
                          value: controller.switchBtnEnableInStock.value,
                          onChanged: controller.onEnableInStock),
                    ),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                  // - - - - - - - - - - - - - - - - - - BUTTON CREATE STORE - - - - - - - - - - - - - - - - - -  //
                  CustomElevatedButton(text: "Create Product", onClick: controller.onCreateProduct, withDefaultPadding: false)

                ],
              ),
            ),
          ),
        ));
  }
}
