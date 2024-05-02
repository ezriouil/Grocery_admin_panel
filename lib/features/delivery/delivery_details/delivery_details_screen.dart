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
      ),
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          margin:
                              const EdgeInsets.only(top: 8, right: 8, left: 8),
                          width: getWidth(context),
                          height: getHeight(context) / 3,
                          child: Image.network(
                              controller.delivery.value.image ?? "",
                              height: getHeight(context),
                              width: getWidth(context),
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
                                  Iconsax.pen_add,
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
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
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
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
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
                                      .headlineMedium
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.email,
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
                                      .bodyLarge
                                      ?.copyWith(
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                        color: darkLightColor(context)
                                            .withOpacity(0.6),
                                      ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.timeline,
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
                                      .headlineMedium
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
                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: 75,
                                  maxProgress: 100,
                                  color: CustomColors.BLUE_LIGHT,
                                  name: "New",
                                  size: 0,
                                  onClick: () {},
                                )),
                                SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: 50,
                                  maxProgress: 100,
                                  color: CustomColors.YELLOW_LIGHT,
                                  name: "Wait",
                                  size: 0,
                                  onClick: () {},
                                )),
                              ],
                            ),
                            const SizedBox(
                                height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomStatistic(
                                  progress: 25,
                                  maxProgress: 100,
                                  color: CustomColors.GREEN_LIGHT,
                                  name: "Accept",
                                  size: 0,
                                  onClick: () {},
                                )),
                                SizedBox(
                                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                                Expanded(
                                    child: CustomStatistic(
                                  progress: 25,
                                  maxProgress: 100,
                                  color: CustomColors.RED_LIGHT,
                                  name: "Refuse",
                                  size: 0,
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
