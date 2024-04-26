import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../seller_add_new_product_to_store/seller_add_new_product_to_store_screen.dart';

class SellerStoreDetailsScreen extends CustomState {
  const SellerStoreDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Store Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: Get.back,
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () { Get.to(()=> const SellerAddNewProductToStoreScreen()); },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        )
    );
  }
}
