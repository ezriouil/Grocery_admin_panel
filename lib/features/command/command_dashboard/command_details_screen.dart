import 'package:flutter/material.dart';

import '../../../utils/state/custom_state.dart';

class CommandDashboardScreen extends CustomState {
  const CommandDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Command Dashboard")),
    );
  }
}

