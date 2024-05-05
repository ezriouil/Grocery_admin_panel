import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_details/delivery_details_controller.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_statistic.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';

class DeliveryDetailsScreen extends CustomState {
  const DeliveryDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    DeliveryDetailsController controller = Get.put(DeliveryDetailsController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Delivery Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: controller.onDeleteDelivery,
              child: Icon(Iconsax.shop_remove, color: darkLightColor(context)),
            ),
            InkWell(
              onTap: controller.onNavigateToDeliveryEditScreen,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
                child:
                  Icon(Iconsax.edit, color: darkLightColor(context)),
              ),
            ),
          ]),
      body: SingleChildScrollView(
          child: Obx(
        () => controller.error.value != ""
            ? const Center(child: Text("Not Found"))
            : controller.delivery.value.id == ""
                ? const Center(child: SizedBox())
                : Column(
                    children: [
                      Container(
                        width: 160.0,
                        height: 160.0,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT), border: Border.all(color: darkLightColor(context))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
                          child: Image.network(
                              width: getWidth(context),
                              height: getHeight(context),
                              controller.delivery.value.image ?? "",
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: primaryColor(context)),),
                              errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context)))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_DEFAULT, horizontal: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Information", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.user,
                                  color:grayColor(context),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                ),
                                Text(controller.delivery.value.fullName ?? "", style: Theme.of(context).textTheme.bodySmall
                                )
                              ],
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.direct_right,
                                  color:grayColor(context),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                ),
                                Text(controller.delivery.value.email ?? "", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.password_check,
                                  color:grayColor(context),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                ),
                                Text(controller.delivery.value.password ?? "", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.call,
                                  color:grayColor(context),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                ),
                                Text(controller.delivery.value.phoneNumber ?? "", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            Row(
                              children: [
                                Icon(
                                  Iconsax.location,
                                  color:grayColor(context),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
                                ),
                                Text(controller.delivery.value.location ?? "", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),


                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                            Text("Statistics", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1)),
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                            // - - - - - - - - - - - - - - - - - - Statistic ROW 1 - - - - - - - - - - - - - - - - - -  //
                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.newCommand.value.toDouble() ,
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: blueColor(context),
                                  name: "New",
                                  size: controller.newCommand.value
                                )),
                                const SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.waitCommand.value.toDouble(),
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: yellowColor(context),
                                  name: "Wait",
                                  size: controller.waitCommand.value,
                                )),
                              ],
                            ),

                            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                            // - - - - - - - - - - - - - - - - - - Statistic ROW 2 - - - - - - - - - - - - - - - - - -  //
                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.confirmedCommand.value.toDouble(),
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: greenColor(context),
                                  name: "Accept",
                                  size: controller.confirmedCommand.value,
                                )),
                                const SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.declinedCommand.value.toDouble(),
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: redColor(context),
                                  name: "Refuse",
                                  size: controller.declinedCommand.value,
                                )),
                              ],
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
      )),
    );
  }
}
