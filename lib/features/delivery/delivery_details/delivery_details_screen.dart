import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
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
                child: Stack(children: [
                  Icon(Iconsax.edit, color: darkLightColor(context)),
                  const Positioned(right: 0, child: Badge())
                ]),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                              ),
                          margin:
                              const EdgeInsets.only(top: 8, right: 8, left: 8),
                          width: getWidth(context) / 2.3,
                          height: getHeight(context) / 4,
                          child: Image.network(
                              controller.delivery.value.image ?? "",
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) =>
                                  loadingProgress == null
                                      ? child
                                      : Center(
                                          child: CircularProgressIndicator(
                                              color: primaryColor(context)),
                                        ),
                              errorBuilder: (context, url, error) => Center(
                                  child: Icon(Iconsax.gallery_remove,
                                      size: 30.0, color: grayColor(context)))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About Delivery",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Iconsax.user,
                                  color:
                                      darkLightColor(context).withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.delivery.value.fullName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Iconsax.call),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.delivery.value.phoneNumber!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Iconsax.location),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.delivery.value.location!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Iconsax.direct_right,
                                  color:
                                      darkLightColor(context).withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.delivery.value.email!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Iconsax.timer,
                                  color:
                                      darkLightColor(context).withOpacity(0.6),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  controller.delivery.value.createAt!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Text(
                              "About Statistics",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // - - - - - - - - - - - - - - - - - - Statistic ROW 1 - - - - - - - - - - - - - - - - - -  //

                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.newCommand.value /
                                      controller.commandstest.length,
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: CustomColors.BLUE_LIGHT,
                                  name: "New",
                                  size: controller.newCommand.value ?? 0,
                                  onClick: () {},
                                )),
                                const SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.waitCommand.value /
                                      controller.commandstest.length,
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: CustomColors.YELLOW_LIGHT,
                                  name: "Wait",
                                  size: controller.waitCommand.value,
                                  onClick: () {},
                                )),
                              ],
                            ),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                            // - - - - - - - - - - - - - - - - - - Statistic ROW 2 - - - - - - - - - - - - - - - - - -  //

                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.confirmedCommand.value /
                                      controller.commandstest.length,
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: CustomColors.GREEN_LIGHT,
                                  name: "Accept",
                                  size: controller.confirmedCommand.value,
                                  onClick: () {},
                                )),
                                SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: controller.declinedCommand.value /
                                      controller.commandstest.length,
                                  maxProgress:
                                      controller.commandstest.length.toDouble(),
                                  color: CustomColors.RED_LIGHT,
                                  name: "Refuse",
                                  size: controller.declinedCommand.value,
                                  onClick: () {},
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
