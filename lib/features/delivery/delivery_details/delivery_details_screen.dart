import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_statistic.dart';
import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';

class DeliveryDetailsScreen extends CustomState {
  const DeliveryDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Statistics", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Row(
              children: [
                Expanded(
                    child: CustomStatistic(
                      progress: 25,
                      maxProgress: 100,
                      color: CustomColors.BLUE_DARK,
                      name: "New",
                      size: 9,
                      onClick: (){},
                    )),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                    child: CustomStatistic(
                      progress: 10,
                      maxProgress: 100,
                      color: CustomColors.YELLOW_LIGHT,
                      name: "Waiting",
                      size: 0,
                      onClick: (){},
                    )),
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            Row(
              children: [
                Expanded(
                    child: CustomStatistic(
                      progress: 25,
                      maxProgress: 100,
                      color: CustomColors.GREEN_LIGHT,
                      name: "Accepted",
                      size: 9,
                      onClick: (){},
                    )),
                const SizedBox(
                    width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                    child: CustomStatistic(
                      progress: 10,
                      maxProgress: 100,
                      color: CustomColors.RED_LIGHT,
                      name: "Refused",
                      size: 0,
                      onClick: (){},
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
