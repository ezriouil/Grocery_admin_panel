import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_grid_view.dart';
import 'package:grocery_admin_panel/common/widgets/custom_product.dart';
import 'package:grocery_admin_panel/features/seller/seller_store_details/seller_store_details_controller.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/state/custom_state.dart';
import '../seller_add_new_product_to_store/seller_add_new_product_to_store_screen.dart';

class SellerStoreDetailsScreen extends CustomState {
  const SellerStoreDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerStoreDetailsController controller = Get.put(SellerStoreDetailsController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Store Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: Get.back,
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS),
                child: Icon(Iconsax.share, color: darkLightColor(context)),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            child: Obx(
                    ()=> controller.error.value != "" ? const Center(child: Text("Not Found")) :
                    controller.store.value.id == "" ? const Center(child: Text("...")) :
                    Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(top: CustomSizes.SPACE_BETWEEN_ITEMS),
                              width: getWidth(context),
                              height: 150.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                  color: primaryColor(context)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 80.0,
                                    height: 80.0,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                        border: Border.all(color: darkDarkLightLightColor(context))),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                        child: Image.network(
                                            controller.store.value.image ?? "",
                                            fit: BoxFit.cover)),
                                  ),
                                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                                  Text(controller.store.value.title ?? "", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: CustomColors.WHITE)),
                                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                                ],
                              ),
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
                                    itemBuilder: (BuildContext context, int index) => CustomProduct(product: controller.storeProducts[index], onClick: controller.onNavigateProductDetail)
                                )) : const Center(child: Text("No Products"))
                          ],
                        ))
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Get.to(()=> const SellerAddNewProductToStoreScreen(), arguments: [controller.store.value.id, controller.store.value.title]);},
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        )
    );
  }
}
