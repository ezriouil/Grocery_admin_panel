import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/state/custom_state.dart';
import 'commad_dashborad_controller.dart';

class CommandDashboardScreen extends CustomState {
  const CommandDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final CommandDashboardController controller = Get.put(CommandDashboardController());


    return Scaffold(
      appBar: AppBar(
        title: Text("Command Dashboard",
            style: Theme.of(context).textTheme.headlineSmall),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(Iconsax.arrow_left_24, color: darkLightColor(context)),
        ),
      ),
      body: Obx(() {
        if (controller.commands == null) {
          // Show a loading indicator
          return const Center(child: CircularProgressIndicator());
        } else if (controller.commands.isEmpty) {
          // Show an empty message
          print(controller.commands.value);
          return const Center(child: Text('No commands found'));
        } else {
          // Display the list of commands
          return ListView.builder(
            itemCount: controller.commands.length,
            itemBuilder: (context, index) {
              final command = controller.commands[index];
              return ListTile(
                title: Text(command.clientName!),
                subtitle: Text(command.clientPhoneNumber!),
              );
            },
          );
        }
      })

    );
  }
}

