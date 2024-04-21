import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';

class MainDashboardScreen extends Responsive {
  const MainDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return Container(color: darkDarkLightLightColor(context));
  }
}
