 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/common/widgets/custom_outlined_button.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/seller_product_detail_controller.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/widgets/custom_carousel_product.dart';
import 'package:grocery_admin_panel/utils/constants/custom_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/constants/custom_txt_strings.dart';
import '../../../utils/state/custom_state.dart';
import 'widgets/custom_product_thumbnaill.dart';

class SellerProductDetailScreen extends CustomState {
  const SellerProductDetailScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerProductDetailController controller = Get.put(SellerProductDetailController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Product Details", style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: controller.onDeleteProduct,
              borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
              child: Icon(Iconsax.card_remove, color: darkLightColor(context)),
            ),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
          ]
        ),
      body: SingleChildScrollView(
        child: Obx( () => controller.error.value != "" ?
        Center(child: Text(controller.error.value)) : 
        controller.product.value.id == "" ?
        const SizedBox() :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // - - - - - - - - - - - - - - - - - - CAROUSEL - - - - - - - - - - - - - - - - - -  //
            CustomCarouselProduct(
                controller: controller.pageController,
                images : [
                  controller.product.value.image1 ?? "",
                  controller.product.value.image2 ?? "",
                  controller.product.value.image3 ?? "",
                ],
                onPageChange: (index, _) {
                  controller.currentPageIndex.value = index;
                },
                currentIndex: controller.currentPageIndex.value),

            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                  Text(controller.product.value.title ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkLightColor(context), fontWeight: FontWeight.bold)),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - PRICE + DISCOUNT - - - - - - - - - - - - - - - - - -  //
                  Row(
                      children: [
                        // - - - - - - - - - - - - - - - - - - DISCOUNT - - - - - - - - - - - - - - - - - -  //
                        Container(
                          alignment: Alignment.center,
                          width: CustomSizes.SPACE_DEFAULT * 2,
                          height: CustomSizes.SPACE_BETWEEN_SECTIONS,
                          decoration: const BoxDecoration(color: CustomColors.YELLOW_LIGHT,
                              borderRadius: BorderRadius.all(Radius.circular(8.0))),
                          child: Text("${(((controller.product.value.oldPrice - controller.product.value.price) / controller.product.value.oldPrice) * 100).toStringAsFixed(0)}%", style: Theme.of(context).textTheme.bodySmall?.copyWith(color :CustomColors.BLACK)),
                        ),

                        // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                        const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),

                        // - - - - - - - - - - - - - - - - - - PRICES - - - - - - - - - - - - - - - - - -  //
                        Row(
                          children: [
                            // - - - - - - - - - - - - - - - - - - CURRENT PRICE - - - - - - - - - - - - - - - - - -  //
                            RichText(
                              text: TextSpan(
                                text: (controller.product.value.price - 1).toString(),
                                style: Theme.of(context).textTheme.titleLarge,
                                children: [
                                  TextSpan(
                                    text: ".99 MAD",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: darkLightColor(context), letterSpacing: 0.4),
                                  )
                                ],
                              ),
                            ),

                            // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                            // - - - - - - - - - - - - - - - - - - OLD PRICE - - - - - - - - - - - - - - - - - -  //
                            RichText(
                              text: TextSpan(
                                text: "${controller.product.value.oldPrice - 1}",
                                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: darkLightColor(context).withOpacity(0.6),
                                    decoration: TextDecoration.lineThrough),
                                children: [
                                  TextSpan(
                                    text: ".99 MAD",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: darkLightColor(context).withOpacity(0.6),
                                        fontSize: 12.0,
                                        decoration: TextDecoration.lineThrough),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )

                      ]),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - RATE + SHARE + BRAND - - - - - - - - - - - - - - - - - -  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // - - - - - - - - - - - - - - - - - - STOCK ROW - - - - - - - - - - - - - - - - - -  //
                          Row(
                            children: [
                              // - - - - - - - - - - - - - - - - - - STOCK TITLE - - - - - - - - - - - - - - - - - -  //
                              Text("Stock : ", style: Theme.of(context).textTheme.bodyLarge),

                              // - - - - - - - - - - - - - - - - - - IN / OUT STOCK - - - - - - - - - - - - - - - - - -  //
                              Text(controller.product.value.inStock ? "In Stock" : "Out Stock", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: controller.product.value.inStock ? CustomColors.GREEN_LIGHT : CustomColors.RED_LIGHT))
                            ],
                          ),

                          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                          // - - - - - - - - - - - - - - - - - - BRAND - - - - - - - - - - - - - - - - - -  //
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // - - - - - - - - - - - - - - - - - - STORE NAME + ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                              Text(
                                controller.product.value.storeName ?? "",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
                              // - - - - - - - - - - - - - - - - - - ICON VERIFY - - - - - - - - - - - - - - - - - -  //
                              const Icon(Iconsax.verify5, size: 14.0, color: Colors.blue),
                            ],
                          ),

                          // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                          const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                          // - - - - - - - - - - - - - - - - - - STORE NAME - - - - - - - - - - - - - - - - - -  //
                          Row(
                            children: [

                              // - - - - - - - - - - - - - - - - - - RATING ICON - - - - - - - - - - - - - - - - - -  //
                              const Icon(Iconsax.star5, size: 20, color: CustomColors.YELLOW_LIGHT,),

                              // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                              const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                              // - - - - - - - - - - - - - - - - - - RATING - - - - - - - - - - - - - - - - - -  //
                              Text("5.0 (+99)", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: darkLightColor(context).withOpacity(0.8)))

                            ],
                          ),

                        ],
                      ),

                      // - - - - - - - - - - - - - - - - - - SHARE BUTTON - - - - - - - - - - - - - - - - - -  //
                      InkWell(
                        onTap: controller.onShareProductsInfo,
                        child: Icon(Iconsax.direct_up, color: darkLightColor(context),),
                      )
                    ],
                  ),



                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - DESCRIPTION TITLE - - - - - - - - - - - - - - - - - -  //
                  Text("Description", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                  // - - - - - - - - - - - - - - - - - - DESCRIPTION BODY - - - - - - - - - - - - - - - - - -  //
                  ReadMoreText(controller.product.value.description ?? "",
                    trimMode: TrimMode.Line,
                    trimExpandedText: " show less",
                    trimCollapsedText: " read more",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: isDark(context) ? CustomColors.WHITE.withOpacity(0.7) : CustomColors.BLACK.withOpacity(0.7)),
                    moreStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: CustomColors.RED_LIGHT),
                    lessStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: CustomColors.RED_LIGHT),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                  // - - - - - - - - - - - - - - - - - - SECTION TITLE - - - - - - - - - - - - - - - - - -  //
                  Text("Product Images", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - THUMBNAIL 1 - - - - - - - - - - - - - - - - - -  //
                  CustomProductThumbnail(image: controller.product.value.image1 ?? ""),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - THUMBNAIL 2 - - - - - - - - - - - - - - - - - -  //
                  CustomProductThumbnail(image: controller.product.value.image2 ?? ""),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                  // - - - - - - - - - - - - - - - - - - THUMBNAIL 3 - - - - - - - - - - - - - - - - - -  //
                  CustomProductThumbnail(image: controller.product.value.image3 ?? ""),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(
                      height: CustomSizes.SPACE_DEFAULT),

                  // - - - - - - - - - - - - - - - - - - COPYRIGHT TEXT - - - - - - - - - - - - - - - - - -  //
                  SizedBox(
                    width: getWidth(context),
                    child: Text(
                      "Copyright © 2024 ${CustomTextStrings.APP_NAME}.\nAll rights reserved.",
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                  const SizedBox(
                      height: CustomSizes.SPACE_BETWEEN_ITEMS),
                ],
              ),
            )
          ],
        )
        ),
      ),
      bottomNavigationBar: Obx( () => controller.product.value.hasPermission ?
      const SizedBox() :
      Container(
        decoration: BoxDecoration(
            color: grayColor(context),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS),
                topRight: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS))),
        child: Row(
          children: [
            Expanded(child: CustomOutlinedButton(text: "Reject", onClick: controller.onRejectProduct)),
            Expanded(child: CustomElevatedButton(text: "Accept", onClick: controller.onAcceptProduct)),
          ],
        ),
      )),
    );
  }
}
