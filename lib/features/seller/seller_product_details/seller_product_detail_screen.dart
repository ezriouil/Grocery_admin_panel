import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/seller_product_detail_controller.dart';
import 'package:grocery_admin_panel/features/seller/seller_product_details/widgets/custom_carousel_product.dart';
import 'package:grocery_admin_panel/utils/constants/custom_colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../utils/constants/custom_sizes.dart';
import '../../../utils/state/custom_state.dart';

class SellerProductDetailScreen extends CustomState {
  const SellerProductDetailScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - - - - - - - - - - - - INJECT THE CONTROLLER DEPENDENCE - - - - - - - - - - - - - - - - - -  //
    final SellerProductDetailController controller = Get.put(SellerProductDetailController());

    return Scaffold(
      appBar: AppBar(
          title: Text("Product Details",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
          actions: [
            InkWell(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.only(right: CustomSizes.SPACE_BETWEEN_ITEMS),
                child: Icon(Iconsax.edit, color: darkLightColor(context)),
              ),
            ),
          ]
        ),
      body: SingleChildScrollView(
        child: Obx( () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            // - - - - - - - - - - - - - - - - - - CAROUSEL - - - - - - - - - - - - - - - - - -  //
            CustomCarouselProduct(
                controller: controller.pageController,
                images : const [
                  "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/UND/TV/SX.gif",
                  "https://imgaz.staticbg.com/banggood/os/202401/20240101200711_835.jpg",
                  "https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/SX_Solde.jpg"
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
        
                 // - - - - - - - - - - - - - - - - - - PRICE + DISCOUNT - - - - - - - - - - - - - - - - - -  //
                 Row(
                     children: [
                       // - - - - - - - - - - - - - - - - - - DISCOUNT - - - - - - - - - - - - - - - - - -  //
                       Container(
                         alignment: Alignment.center,
                         width: CustomSizes.SPACE_DEFAULT * 2,
                         decoration: const BoxDecoration(color: CustomColors.YELLOW_LIGHT,
                             borderRadius: BorderRadius.all(Radius.circular(8.0))),
                         padding: const EdgeInsets.symmetric(vertical: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                         child: Text("30%", style: Theme.of(context).textTheme.bodySmall?.copyWith(color :CustomColors.BLACK)),
                       ),
        
                       // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                       const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS),
        
                       // - - - - - - - - - - - - - - - - - - PRICES - - - - - - - - - - - - - - - - - -  //
                       Row(
                         children: [
                           // - - - - - - - - - - - - - - - - - - CURRENT PRICE - - - - - - - - - - - - - - - - - -  //
                           RichText(
                             text: TextSpan(
                               text: (30 - 1).toString(),
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
                               text: "${20 - 1}",
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
                 const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
        
                 // - - - - - - - - - - - - - - - - - - TITLE - - - - - - - - - - - - - - - - - -  //
                 Text("Jean Men's Zara",
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                     style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkLightColor(context), fontWeight: FontWeight.bold)),
        
                 // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                 const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
        
                 // - - - - - - - - - - - - - - - - - - RATE + SHARE - - - - - - - - - - - - - - - - - -  //
                 Row(
                   mainAxisAlignment:
                   MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment:
                       CrossAxisAlignment.start,
                       children: [
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
        
                         // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                         const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        
                         // - - - - - - - - - - - - - - - - - - STOCK ROW - - - - - - - - - - - - - - - - - -  //
                         Row(
                           children: [
                             // - - - - - - - - - - - - - - - - - - STOCK TITLE - - - - - - - - - - - - - - - - - -  //
                             Text("Stock : ", style: Theme.of(context).textTheme.bodyLarge),
        
                             // - - - - - - - - - - - - - - - - - - IN / OUT STOCK - - - - - - - - - - - - - - - - - -  //
                             Text(true ? "In Stock" : "Out Stock", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: true ? CustomColors.GREEN_LIGHT : CustomColors.RED_LIGHT))
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
                 ReadMoreText("Le clavier mécanique SH MK-X60 propose une expérience de jeu idéale dans un format compact et slim avec des Blue Switche. Profitez d'un rétro-éclairage RGB, d'une conception élégante. Ce modèle performant s'intégrera en toute simplicité sur votre bureau pour vous réserver des heures d'utilisation dans les meilleures conditions.",
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
                 ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS), child: Image.network("https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/SX_Solde.jpg", height: 180.0, width: getWidth(context), fit: BoxFit.cover)),

                 // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                 const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                 // - - - - - - - - - - - - - - - - - - THUMBNAIL 2 - - - - - - - - - - - - - - - - - -  //
                 ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS), child: Image.network("https://imgaz.staticbg.com/banggood/os/202401/20240101200711_835.jpg", height: 180.0, width: getWidth(context), fit: BoxFit.cover)),
        
                 // - - - - - - - - - - - - - - - - - - SPACER - - - - - - - - - - - - - - - - - -  //
                 const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
        
                 // - - - - - - - - - - - - - - - - - - THUMBNAIL 3 - - - - - - - - - - - - - - - - - -  //
                 ClipRRect(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS), child: Image.network("https://ma.jumia.is/cms/000_2024/000001_Janvier/SodesHiver/UND/TV/SX.gif", height: 180.0, width: getWidth(context), fit: BoxFit.cover)),
        
               ],
             ),
           )
          ],
        ),
        ),
      ),
    );
  }
}
