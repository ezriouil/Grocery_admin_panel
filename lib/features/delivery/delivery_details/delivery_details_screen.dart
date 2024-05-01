import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_statistic.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';

class DeliveryDetailsScreen extends CustomState {
  const DeliveryDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    Delivery delivery = Get.arguments;
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
        child: Column(
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(top: 8, right: 8, left: 8),
                width: getWidth(context),
                height: getHeight(context) / 3,
                child: Image.network(delivery.image ?? "",
                    height: getHeight(context),
                    width: getWidth(context),
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
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
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
                        color: darkLightColor(context).withOpacity(0.6),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        delivery.fullName!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              color: darkLightColor(context).withOpacity(0.6),
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
                        delivery.phoneNumber!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              color: darkLightColor(context).withOpacity(0.6),
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
                        delivery.location!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              color: darkLightColor(context).withOpacity(0.6),
                            ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.email,
                        color: darkLightColor(context).withOpacity(0.6),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        delivery.email!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              color: darkLightColor(context).withOpacity(0.6),
                            ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timeline,
                        color: darkLightColor(context).withOpacity(0.6),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        delivery.createAt!,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                              color: darkLightColor(context).withOpacity(0.6),
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomStatistic(
                        name: "New",
                        color: Colors.blue.shade400,
                        maxProgress: 12,
                        onClick: (){},
                        progress: 12,
                        size: 140,
                      ),
                      CustomStatistic(
                        name: "Waiting",
                        color: Colors.yellow,
                        maxProgress: 10,
                        onClick: (){},
                        progress: 12,
                        size: 140,
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomStatistic(
                        name: "Confirmed",
                        color: Colors.orange.shade400,
                        maxProgress: 12,
                        onClick: (){},
                        progress: 12,
                        size: 140,
                      ),
                      CustomStatistic(
                        name: "Declined",
                        color: Colors.red.shade400,
                        maxProgress: 12,
                        onClick: (){},
                        progress: 12,
                        size: 140,
                      ),

                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
