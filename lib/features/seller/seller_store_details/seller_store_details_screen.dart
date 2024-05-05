import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_grid_view.dart';
import 'package:grocery_admin_panel/common/widgets/custom_product.dart';
import 'package:grocery_admin_panel/features/seller/seller_store_details/seller_store_details_controller.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/state/custom_state.dart';

class SellerStoreDetailsScreen extends CustomState {
  const SellerStoreDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerStoreDetailsController controller = Get.put(SellerStoreDetailsController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Store Details", style: Theme.of(context).textTheme.headlineSmall),
          centerTitle: false,
          leading: InkWell(
            onTap: Get.back,
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: controller.onDeleteStore,
              borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
              child: Icon(Iconsax.shop_remove, color: darkLightColor(context)),
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
            InkWell(
              onTap: controller.onShareStoreInfo,
              borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
              child: Icon(Iconsax.share, color: darkLightColor(context)),
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
            InkWell(
              onTap: controller.onEditStore,
              borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
              child: Icon(Iconsax.edit, color: darkLightColor(context)),
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          child: Obx(
                  ()=> controller.error.value != "" ? const Center(child: Text("Not Found")) :
                  controller.store.value.id == "" ? const Center(child: SizedBox()) :
                  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: getWidth(context),
                            height: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS), bottomRight: Radius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)),
                                border: Border.all(color: darkDarkLightLightColor(context)), color: primaryColor(context)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 130.0,
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      border: Border.all(color: darkDarkLightLightColor(context))),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                      child: Image.network(
                                          controller.store.value.image ?? "",
                                          height: getHeight(context),
                                          width: getWidth(context),
                                          fit: BoxFit.cover,
                                          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: primaryColor(context)),),
                                          errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))))),
                                ),
                                Text(controller.store.value.title ?? "", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: CustomColors.WHITE, fontWeight: FontWeight.bold, letterSpacing: 1.0), maxLines: 1, overflow: TextOverflow.ellipsis),
                              ],
                            )
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                          Text("Description", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Text(controller.store.value.description ?? "", style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                          Text("About Store", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          Row(
                            children: [
                              Icon(Iconsax.location, color: grayColor(context), size: 20),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              Text(controller.store.value.location ?? "", style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Row(
                            children: [
                              Icon(Iconsax.direct_right, color: grayColor(context), size: 20),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              Text(controller.store.value.email ?? "", style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Row(
                            children: [
                              Icon(Iconsax.call, color: grayColor(context), size: 20),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              Text(controller.store.value.phoneNumber ?? "", style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                          Row(
                            children: [Icon(Iconsax.timer, color: grayColor(context), size: 20),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                              Text(
                                controller.store.value.createAt ?? "",
                                style: Theme.of(context).textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                          Text("Products", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                          controller.storeProducts.isNotEmpty ? SizedBox(
                              width: getWidth(context),
                              child: CustomGridView(
                                  count: controller.storeProducts.length,
                                  itemsHeight: 250,
                                  spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                  itemBuilder: (BuildContext context, int index) => CustomProduct(product: controller.storeProducts[index], onClick: (String productId){controller.onNavigateProductDetail(productId); })
                              )) : const Center(child: Text("No Products"))
                        ],
                      )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.onNavigateAddNewProduct,
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        )
    );
  }
}
