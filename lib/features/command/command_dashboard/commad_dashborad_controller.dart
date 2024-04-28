import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

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
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async {
    commands=[].obs;
    await fetchCommands();
  }

  // Fetch Commands
  Future<void> fetchCommands() async {
    if (commands.isNotEmpty) {
      final data = await CommandRepository.getCommands();
      commands.addAll(data);
    } else {
      commands = [].obs;
    }
  }

  // - - - - - - - - - - - - - - - - - - DISPOSE STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void dispose() {
    super.dispose();
    error.close();
  }
}
