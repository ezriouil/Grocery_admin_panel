import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/seller/seller_notifications/seller_notification_controller.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_grid_view.dart';
import '../../../common/widgets/custom_product.dart';
import '../../../utils/constants/custom_sizes.dart';

class SellerNotificationScreen extends CustomState {
  const SellerNotificationScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerNotificationController controller = Get.put(SellerNotificationController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Notifications",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: Obx( ()=>
            controller.error.value != "" ? Center(child: Text(controller.error.value)) : controller.storeProducts.isEmpty ?
            const Center(child: Text("No products available")) :
            Padding(
              padding: const EdgeInsets.symmetric(horizontal : CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              child: CustomGridView(
                  count: controller.storeProducts.length,
                  itemsHeight: 250,
                  spaceBetweenColumns: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                  itemBuilder: (BuildContext context, int index) =>
                      CustomProduct(
                          product: controller.storeProducts[index],
                          onClick: (String productId){ controller.onNavigateProductDetail(productId); }
                      )
              ),
            ),
        ));
  }
}
