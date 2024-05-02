import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';

class CustomStoreCard extends CustomState {
  final String storeId, storeName, storeImage;
  final int productsCount;
  final Function(String storeId) onClick;
  
  const CustomStoreCard({super.key, required this.storeId, required this.storeName, required this.storeImage, required this.productsCount, required this.onClick, });

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: (){ onClick(storeId); },
      borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), border: Border.all(color: darkLightColor(context))),
        child: Row(
          children: [

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
            Container(
              width: 40,
              height: 40, 
              decoration: BoxDecoration(border: Border.all(color: darkLightColor(context)), borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                  child: Image.network(storeImage,
                      height: getHeight(context),
                      width: getWidth(context),
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: primaryColor(context)),),
                      errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 20.0, color: grayColor(context)))),
                ),
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - - STORE NAME + PRODUCTS COUNT - - - - - - - - - - - - - - - - - -  //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [

                    // - - - - - - - - - - - - - - - - - - STORE NAME - - - - - - - - - - - - - - - - - -  //
                    Text(storeName.length > 10 ? "${storeName.substring(storeName.length - 10)}..." : storeName, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis, maxLines: 1),

                    // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                    // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                    const Icon(Iconsax.verify5, size :12, color: CustomColors.BLUE_LIGHT),
                  ],
                ),

                // - - - - - - - - - - - - - - - - - - PRODUCTS COUNT - - - - - - - - - - - - - - - - - -  //
                Text("$productsCount products", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0), maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
