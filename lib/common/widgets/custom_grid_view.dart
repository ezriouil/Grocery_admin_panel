import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';

class CustomGridView extends CustomState {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemsInRow, count;
  final ScrollController? controller;
  final double? itemsHeight, spaceBetweenColumns, spaceBetweenRows;

  const CustomGridView(
      {super.key,
      required this.itemBuilder,
      this.itemsInRow = 2,
      required this.count,
      this.controller,
      this.itemsHeight,
      this.spaceBetweenColumns,
      this.spaceBetweenRows});

  @override
  Widget execute(BuildContext context) {
    return GridView.builder(
        controller: controller,
        itemCount: count,
        scrollDirection:  Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: itemsInRow,
            mainAxisExtent: itemsHeight ?? 80,
            mainAxisSpacing: spaceBetweenColumns ?? 4.0,
            crossAxisSpacing: spaceBetweenRows ?? 4.0),
        itemBuilder: itemBuilder);
  }
}
