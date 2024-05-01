import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_grid_view.dart';
import 'package:grocery_admin_panel/features/seller/seller_dashboard/seller_dashborad_controller.dart';
import 'package:grocery_admin_panel/features/seller/widgets/custom_store_card.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../seller_add_new_store/seller_add_new_store_screen.dart';

class SellerDashboardScreen extends CustomState {
  const SellerDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerDashboardController controller = Get.put(SellerDashboardController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Seller Dashboard",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: controller.onNavigateToProductsScreen,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                child: Stack(children :[
                  Icon(Iconsax.notification, color: darkLightColor(context)),
                  const Positioned(right: 0,child: Badge())
                ]),
              ),
            ),
          ]
        ),
        body: Obx(
                () => controller.error.value != "" ?
                Center(child: Text(controller.error.value)) :
                    controller.stores.isEmpty ?  Center(child: Text(controller.error.value))  : Padding(padding: const EdgeInsets.symmetric(
                        horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 4), child: CustomGridView(
                        count: controller.stores.length,
                        itemBuilder: (BuildContext context, int index) => CustomStoreCard(
                          storeName: controller.stores[index].title ?? "",
                          productsCount: 10,
                          storeId: controller.stores[index].id ?? "",
                          onClick: controller.onNavigateToStoreDetailScreen,
                        )))
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const SellerAddNewStoreScreen());
          },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        ));
  }
}
