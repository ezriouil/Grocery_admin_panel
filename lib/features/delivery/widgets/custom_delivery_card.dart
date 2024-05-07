import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/common/widgets/custom_elevated_button.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_sizes.dart';

class CustomDeliveryCard extends CustomState {
  final String deliveryId, deliveryName, deliveryImage, deliveryphone, deliveryLocation;
  final Function(String deliveryId) onClick;

  const CustomDeliveryCard({ super.key, required this.deliveryId, required this.deliveryName, required this.deliveryImage, required this.deliveryphone, required this.deliveryLocation, required this.onClick,});

  @override
  Widget execute(BuildContext context) {
    return Card(
      color: darkDarkLightLightColor(context),
      shadowColor: darkLightColor(context),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        side: BorderSide(color: darkLightColor(context), width: 0.4),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
            child: SizedBox(
              width: getWidth(context),
              height: 130.0,
              child: Image.network(deliveryImage,
                  height: getHeight(context),
                  width: getWidth(context),
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : Center(
                    child: CircularProgressIndicator(
                        color: primaryColor(context)),
                  ),
                  errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context)))),
            ),
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
          Row(
            children: [
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Icon(Iconsax.user, size: 20.0, color: grayColor(context)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(deliveryName, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Icon(Iconsax.call, size: 20.0, color: grayColor(context)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(deliveryphone, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Icon(Iconsax.location, size: 20.0, color: grayColor(context)),
              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              Text(deliveryLocation, style: Theme.of(context).textTheme.bodySmall, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          ),
          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          CustomElevatedButton(text: "View More", onClick: (){onClick(deliveryId);}, height: 68),
        ],
      ),
    );
  }
}

