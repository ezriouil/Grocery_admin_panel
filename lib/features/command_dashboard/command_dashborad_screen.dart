import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';

class CommandDashboardScreen extends Responsive {
  const CommandDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Command Dashboard")),
    );
  }
}

