import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:grocery_admin_panel/common/widgets/custom_loading.dart';

import '../../../data/models/command.dart';
import '../../../data/repositories/command_repositories/command_repository.dart';

class CommandDashboardController extends GetxController {
  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late final RxString error;
  late final RxList<dynamic> commands;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    error = "".obs;
    commands = [].obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    await fetchCommands();
  }

  // Fetch Commands
  Future<void> fetchCommands() async {
    try {
      CustomLoading.start();
      if (commands.isNotEmpty) {
        commands.value = await CommandRepository.getCommands();
        CustomLoading.stop();
      } else {
        commands = RxList();
      }
    } catch (e) {
      CustomLoading.stop();
      error.value = e.toString();
    }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
