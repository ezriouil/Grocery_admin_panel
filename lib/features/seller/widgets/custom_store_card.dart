import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/constants/custom_icon_strings.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_colors.dart';
import '../../../utils/constants/custom_sizes.dart';

class CustomStoreCard extends CustomState {
  final String storeId, storeName;
  final int productsCount;
  final Function(String storeId) onClick;
  
  const CustomStoreCard({super.key, required this.storeId, required this.storeName, required this.productsCount, required this.onClick, });

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: ()=>onClick(storeId),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2), border: Border.all(color: darkLightColor(context))),
        child: Row(
          children: [

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

            // - - - - - - - - - - - - - - - - - - IMAGE - - - - - - - - - - - - - - - - - -  //
            Container(width: 40, height: 40,
                padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT)),
                child: Image.asset(CustomIconStrings.APP_LOGO)
            ),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - - TITLE + PRODUCTS COUNT - - - - - - - - - - - - - - - - - -  //
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(storeName.length > 8 ? "${storeName.substring(storeName.length - 8)}..." : storeName, style: Theme.of(context).textTheme.bodyLarge, overflow: TextOverflow.ellipsis, maxLines: 1),

                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                    // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                    const Icon(Iconsax.verify5, size :12, color: CustomColors.BLUE_LIGHT),
                  ],
                ),
                Text("$productsCount products", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10.0), maxLines: 1, overflow: TextOverflow.ellipsis,),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
