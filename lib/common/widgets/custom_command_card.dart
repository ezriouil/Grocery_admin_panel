import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/constants/custom_sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../data/models/command.dart';
import '../../utils/state/custom_state.dart';

class CustomCommandCard extends CustomState {
  final double height;
  final double width;
  final Color color;
  final double radiuscommand;
  final Command command;

  const CustomCommandCard(
      this.height, this.width, this.color, this.radiuscommand, this.command,
      {super.key});

  @override
  Widget execute(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.only(
          left: CustomSizes.SPACE_BETWEEN_ITEMS,
          right: CustomSizes.SPACE_BETWEEN_ITEMS,
          top: CustomSizes.SPACE_BETWEEN_ITEMS / 2,
          bottom: CustomSizes.SPACE_BETWEEN_ITEMS),
      height: 159,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(radiuscommand)),
      ),
      child: Stack(
        children:[
          const Align(alignment: Alignment.topRight,child: Icon(Icons.turn_slight_right), ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("assets/logos/logo.png"),
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(
                    width: CustomSizes.SPACE_BETWEEN_ITEMS * 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            command.clientName!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(Iconsax.home),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                command.location!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Iconsax.mobile),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "${command.clientPhoneNumber}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Iconsax.status),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                command.status!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Iconsax.money),
                              const SizedBox(
                                width: 7,
                              ),
                              Text(
                                "${command.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 15),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          )
        ] ,
      ),
    );
  }
}
