import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:iconsax/iconsax.dart';

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
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
              child: Container(
                width: getWidth(context),
                padding: const EdgeInsets.only(top: 25.0),
                height: 170.0,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: primaryColor(context),
                  borderRadius:
                      BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: Image.network(
                                delivery.image!,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 120,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  delivery.fullName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                          fontSize: 20,
                                          color:
                                              darkDarkLightLightColor(context)),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(delivery.location!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: darkDarkLightLightColor(
                                                context))),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text("12",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                )),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text("Orders",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                ))
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Column(
                                      children: [
                                        Text("8",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                )),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text("Confirmed",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                ))
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 23,
                                    ),
                                    Column(
                                      children: [
                                        Text("4",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                )),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text("Declined",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                  fontSize: 15,
                                                  color:
                                                      darkDarkLightLightColor(
                                                          context),
                                                ))
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          delivery.createAt!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontSize: 12,
                                color: darkDarkLightLightColor(context),
                              ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
