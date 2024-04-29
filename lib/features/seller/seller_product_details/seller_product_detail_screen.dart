import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/seller_product_detail_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/state/custom_state.dart';

class SellerProductDetailScreen extends CustomState {
  const SellerProductDetailScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerProductDetailController controller = Get.put(SellerProductDetailController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Product Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
      body: Center(child: Text(controller.productId)),
    );
  }
}
