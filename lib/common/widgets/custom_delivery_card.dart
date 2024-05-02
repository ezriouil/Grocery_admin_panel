import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:grocery_admin_panel/data/models/delivery.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/custom_sizes.dart';

class CustomDeliveryCard extends CustomState {
  Delivery delivery;
  final Function(String storeId) onClick;

  CustomDeliveryCard(this.delivery, this.onClick);

  @override
  Widget execute(BuildContext context) {
    return Card(
      elevation: 0.5,
      shadowColor: Colors.black,
      shape: const RoundedRectangleBorder(),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 140.0,
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
            Container(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(delivery.fullName!,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      )),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: primaryColor(context),
                    borderRadius: BorderRadius.circular(9)),
                height: 40,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    onClick(delivery.id!);
                  },
                  child: Text(
                    "View More",
                    style: TextStyle(
                        fontSize: 12, color: darkDarkLightLightColor(context)),
                  ),
                ),
              ),
            ))
      ]),
    );
  }
}
