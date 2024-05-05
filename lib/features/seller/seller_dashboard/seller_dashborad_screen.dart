import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_grid_view.dart';
import 'package:grocery_admin_panel/features/seller/seller_dashboard/seller_dashborad_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';
import 'widgets/custom_store_card.dart';

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
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: InkWell(
                onTap: controller.onNavigateToProductsScreen,
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
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
                          storeImage: controller.stores[index].image ?? "",
                          productsCount: 10,
                          storeId: controller.stores[index].id ?? "",
                          onClick: controller.onNavigateToStoreDetailScreen,
                        )))
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.onNavigateToAddNewStore,
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        ));
  }
}
