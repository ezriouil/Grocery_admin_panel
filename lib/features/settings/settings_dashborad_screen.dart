import 'package:grocery_admin_panel/utils/constants/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/responsive/responsive.dart';
import 'package:flutter/services.dart';

class SellerDashboardScreen extends Responsive {
  const SellerDashboardScreen({super.key});

  @override
  Widget execute(BuildContext context) {

    // - - - - - - - CHANGE THEME OF TOP STATUS BAR AND SYSTEM BOTTOM BAR - - - - - - - - -  //
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      statusBarIconBrightness: isDark(context) ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark(context) ? Brightness.light : Brightness.dark,
      systemNavigationBarColor: isDark(context) ? CustomColors.BLACK : CustomColors.WHITE,
      systemNavigationBarIconBrightness: isDark(context) ? Brightness.light : Brightness.dark,
    ));

    return Container(color: darkDarkLightLightColor(context));
  }
}
