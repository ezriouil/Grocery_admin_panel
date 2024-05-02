import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_statistic.dart';
import 'package:grocery_admin_panel/features/delivery/delivery_add_new/delivery_add_new_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';

class DeliveryDashboardScreen extends CustomState {
  const DeliveryDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Delivery Dashboard",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                      child: CustomStatistic(
                        progress: 75,
                        maxProgress: 100,
                        color: CustomColors.BLUE_LIGHT,
                        name: "New",
                        size: 0,
                      )),
                  SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  Expanded(
                      child: CustomStatistic(
                        progress: 50,
                        maxProgress: 100,
                        color: CustomColors.YELLOW_LIGHT,
                        name: "Wait",
                        size: 0,
                      )),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              const Row(
                children: [
                  Expanded(
                      child: CustomStatistic(
                        progress: 25,
                        maxProgress: 100,
                        color: CustomColors.GREEN_LIGHT,
                        name: "Accept",
                        size: 0,
                      )),
                  SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  Expanded(
                      child: CustomStatistic(
                        progress: 25,
                        maxProgress: 100,
                        color: CustomColors.RED_LIGHT,
                        name: "Refuse",
                        size: 0,
                      )),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS/2, vertical: CustomSizes.SPACE_BETWEEN_ITEMS/4),
                  visualDensity: const VisualDensity(vertical: -4, horizontal: -2),
                  tileColor: CustomColors.GREEN_LIGHT.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color:CustomColors.GREEN_LIGHT),
                      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
                  leading: Container(
                    padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS/3),
                    decoration: BoxDecoration(
                        color: CustomColors.GREEN_LIGHT,
                        borderRadius: BorderRadius.circular(
                            CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                    child: Image.asset("assets/images/line_chart.png", width: 24, height: 24,color: CustomColors.GREEN_DARK),
                  ),
                  title:Text( "HAY RACHAD G10", style: Theme.of(context).textTheme.bodyLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                  subtitle: Text("Wed 14 Fab 09:45", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10)),
                  trailing: IconButton(onPressed: (){}, icon: Container(
                      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS/4),
                      decoration: BoxDecoration(
                          color: CustomColors.GREEN_LIGHT.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                              CustomSizes.SPACE_BETWEEN_ITEMS)),
                      child: Icon(Iconsax.more_2,size: 20, color: darkLightColor(context),)),
                    visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const DeliveryAddNewScreen());
          },
          backgroundColor: primaryColor(context),
          child: const Icon(Iconsax.add, color: CustomColors.WHITE),
        ));
  }
}
