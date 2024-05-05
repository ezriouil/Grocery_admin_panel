import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/state/custom_state.dart';

class CustomProductThumbnail extends CustomState {
  final String image;

  const CustomProductThumbnail({super.key, required this.image});

  @override
  Widget execute(BuildContext context) {
    return Container(
      height: 200.0,
      width: getWidth(context),
      decoration: BoxDecoration(border: Border.all(color: darkLightColor(context)), borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS)),
      child: ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS), child: Image.network(image,
          height: getHeight(context),
          width: getWidth(context),
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: primaryColor(context)),),
          errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context))))),
    );
  }
}
