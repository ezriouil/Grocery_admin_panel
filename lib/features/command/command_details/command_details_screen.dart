import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/state/custom_state.dart';

class CommandDetailsScreen extends CustomState {
  const CommandDetailsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Command Details",
            style: Theme.of(context).textTheme.headlineSmall),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
        ),
      ),
      body: const Center(child: Text("Command Details")),
    );
  }
}

