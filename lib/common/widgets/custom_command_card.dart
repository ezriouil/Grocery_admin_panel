import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/state/custom_state.dart';

class CustomCard extends CustomState {
  final double height;
  final double width;
  final Color color;
  final double radiuscommand;

  CustomCard(this.height, this.width, this.color, this.radiuscommand,
      {super.key});

  @override
  Widget execute(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: 159,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radiuscommand)),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
            left: CustomSizes.SPACE_BETWEEN_ITEMS,
            right: CustomSizes.SPACE_BETWEEN_ITEMS,
            top: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
            bottom: CustomSizes.SPACE_BETWEEN_ITEMS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Center(
                  child: Image(
                    image: AssetImage("assets/logos/logo.png"),
                    height: 80,
                    width: 80,
                  ),
                ),
                SizedBox(
                  width: CustomSizes.SPACE_BETWEEN_ITEMS * 2,
                ),
                Row(
                  children: [
                    Column(
                      children: [

                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ahmed Ezriouil",
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                        ),
                        Row(
                          children: [
                            Icon(Iconsax.home),
                            Text(
                              "Hay Rachad G10 N 10409 Tiflet",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Iconsax.mobile),
                            Text(
                              "0716058783",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Iconsax.status),
                            Text(
                              "Traité",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Iconsax.man4),
                            Text(
                              "Ahmed Sabiri",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
