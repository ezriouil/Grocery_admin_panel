import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';

class SellerDashboardScreen extends Responsive {
  const SellerDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Seller Dashboard")),
    );
  }
}
