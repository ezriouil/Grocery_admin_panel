import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_command_card.dart';
import '../../../utils/state/custom_state.dart';
import 'commad_dashborad_controller.dart';

class CommandDashboardScreen extends CustomState {
  const CommandDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final CommandDashboardController controller =
        Get.put(CommandDashboardController());

    return Scaffold(
        appBar: AppBar(
          title: Text("Command Dashboard",
              style: Theme.of(context).textTheme.headlineSmall),
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
          ),
        ),
        body: Obx(() => controller.error.value != ""
            ? Center(child: Text(controller.error.value))
            : controller.commands.isEmpty
                ? const Center(child: Text("No Commands Found"))
                : ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      final command = controller.commands[index];
                      return CustomCommandCard(
                        70,
                        140,
                        Colors.deepOrangeAccent,
                        23,
                        command,
                      );
                    },
                  )));
  }
}
