import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';
import '../../data/models/product.dart';
import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/custom_sizes.dart';

class CustomProduct extends CustomState {
  final Product? product;
  final Function(String productId) onClick;

  const CustomProduct(
      {super.key,
      required this.product,
      required this.onClick});

  @override
  Widget execute(BuildContext context) {

    const borderRadius12 = Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS);

    // - - - - - - - - - - - - - - - - - - CARD - - - - - - - - - - - - - - - - - -  //
    return Container(
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        border: Border.all(color: grayColor(context), width: 0.5),
        gradient: LinearGradient(
          colors: [
            primaryColor(context),
            darkDarkLightLightColor(context),
            darkDarkLightLightColor(context)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: InkWell(
        onTap: () => {onClick(product?.id ?? "")},
        child: Padding(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS /4),
          // - - - - - - - - - - - - - - - - - - COLUMN - - - - - - - - - - - - - - - - - -  //
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // - - - - - - - - - - - - - - - - - - IMAGE FROM NETWORK - - - - - - - - - - - - - - - - - -  //
              ClipRRect(
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                child: SizedBox(
                  width: getWidth(context),
                  height: 140.0,
                  child: Image.network(
                      product?.image1 ?? "",
                      height: getHeight(context),
                      width: getWidth(context),
                      fit: BoxFit.fitWidth,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) => loadingProgress == null ? child : Center(child: CircularProgressIndicator(color: primaryColor(context)),),
                      errorBuilder: (context, url, error) => Center(child: Icon(Iconsax.gallery_remove, size: 30.0, color: grayColor(context)))),
                ),
              ),

              // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
              Text(
                product?.title ?? "",
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: [
                  // - - - - - - - - - - - - - - - - - - STORE NAME + ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                  Text(
                    product?.storeName ?? "",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12.0),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                  // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                  const Icon(Iconsax.verify5, size: 12.0, color: CustomColors.BLUE_LIGHT),
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS/1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // - - - - - - - - - - - - - - - - - - OLD PRICE - - - - - - - - - - - - - - - - - -  //
                      RichText(
                        text: TextSpan(
                          text: ((product?.oldPrice ?? 2) - 1).toString(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: darkLightColor(context).withOpacity(0.6),
                              decoration: TextDecoration.lineThrough),
                          children: [
                            TextSpan(
                              text: ".99 MAD",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: darkLightColor(context).withOpacity(0.6),
                                  fontSize: 12.0,
                                  decoration: TextDecoration.lineThrough),
                            )
                          ],
                        ),
                      ),
                      // - - - - - - - - - - - - - - - - - - PRICE - - - - - - - - - - - - - - - - - -  //
                      RichText(
                        text: TextSpan(
                          text: ((product?.price ?? 2 )- 1).toString(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: darkLightColor(context), letterSpacing: 0.4),
                          children: [
                            TextSpan(
                              text: ".99 MAD",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: darkLightColor(context), letterSpacing: 0.4),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  // - - - - - - - - - - - - - - - - - - ICON ADD - - - - - - - - - - - - - - - - - -  //
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: primaryColor(context),
                        borderRadius: const BorderRadius.only(
                            topLeft: borderRadius12,
                            bottomRight: borderRadius12)),
                    child: Icon(Iconsax.add,
                        color: darkDarkLightLightColor(context)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
