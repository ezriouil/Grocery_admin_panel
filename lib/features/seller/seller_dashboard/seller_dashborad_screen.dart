import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_outlined_button.dart';
import '../../../utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../seller_add_new_store/seller_add_new_store_screen.dart';
import '../seller_store_details/seller_store_details_screen.dart';

class SellerDashboardScreen extends CustomState {
  const SellerDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Seller Dashboard",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: Center(
          child: CustomOutlinedButton(text: "Store Details", onClick: ()=> Get.to( () => const SellerStoreDetailsScreen()))
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Get.to(()=> const SellerAddNewStoreScreen()); },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        )
    );
  }
}
