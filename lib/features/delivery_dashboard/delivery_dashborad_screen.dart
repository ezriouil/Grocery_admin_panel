import 'package:flutter/material.dart';

import '../../utils/state/custom_state.dart';

class DeliveryDashboardScreen extends CustomState {
  const DeliveryDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Delivery Dashboard")),
    );
  }
}
