import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_grid_view.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_add_new/delivery_add_new_screen.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/state/custom_state.dart';
import '../widgets/custom_delivery_card.dart';
import 'delivery_dashborad_controller.dart';

class DeliveryDashboardScreen extends CustomState {
  const DeliveryDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final DeliveryDashboardController controller =
        Get.put(DeliveryDashboardController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Dashboard",
            style: Theme.of(context).textTheme.headlineSmall),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Get.to(() => const DeliveryAddNewScreen());
        },
        backgroundColor: primaryColor(context),
        child: const Icon(Iconsax.add, color: CustomColors.WHITE),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Obx(() => controller.error.value != ""
            ? Center(child: Text(controller.error.value))
            : controller.deliveries.isEmpty
                ? const Center(child: Text("No Commands Found"))
                : CustomGridView(
                    count: controller.deliveries.length,
                    itemsHeight: 290,
                    itemBuilder: (context, index) {
                      final delivery = controller.deliveries[index];
                      return CustomDeliveryCard(
                        deliveryId: delivery.id ?? "",
                        deliveryName: delivery.fullName ?? "",
                        deliveryImage: delivery.image ?? "",
                        deliveryphone: delivery.phoneNumber ?? "",
                        deliveryLocation: delivery.location ?? "",
                        onClick: (String deliveryId) { controller.onNavigateToDeliveryDetailsScreen(deliveryId); },
                      );
                    })),
      ),
    );
  }
}
