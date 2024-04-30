import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/custom_sizes.dart';

class CustomCarouselProduct extends CustomState {
  final CarouselController controller;
  final List<String> images;
  final Function(int, dynamic) onPageChange;
  final int currentIndex;

  const CustomCarouselProduct(
      {super.key,
      required this.controller,
      required this.images,
      required this.onPageChange,
      required this.currentIndex});

  @override
  Widget execute(BuildContext context) {
    return Container(
      width: getWidth(context),
      height: 240,
      alignment: Alignment.center,
      child: Stack(children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height:200,
            aspectRatio: 16 / 9,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            onPageChanged: onPageChange,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              Image.network(images[index],
                  height: 200,
                  width: getWidth(context), fit: BoxFit.cover,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              count: images.length,
              effect: ExpandingDotsEffect(
                  dotHeight: 4.0,
                  dotColor: darkLightColor(context).withOpacity(0.4),
                  activeDotColor: darkLightColor(context)),
              activeIndex: currentIndex,
            ),
          ),
        ),
      ]),
    );
  }
}
