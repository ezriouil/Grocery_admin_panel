import 'package:flutter/material.dart';
import '../constants/custom_colors.dart';
import '../device/device_utility.dart';

abstract class CustomState extends StatelessWidget {
  const CustomState({super.key});

  @override
  Widget build(BuildContext context) {

    isDark(context);
    darkLightColor(context);
    darkDarkLightLightColor(context);

    isMobile(context);
    isTablet(context);

    return execute(context);
  }

  /// BUILD METHODE
  Widget execute(BuildContext context);

  /// COLORS
  Color darkLightColor(BuildContext context) => isDark(context) ? CustomColors.WHITE : CustomColors.BLACK;
  Color darkDarkLightLightColor(BuildContext context) => isDark(context) ? CustomColors.BLACK : CustomColors.WHITE;
  Color primaryColor(BuildContext context) => isDark(context) ? CustomColors.PRIMARY_LIGHT : CustomColors.PRIMARY_DARK;
  Color grayColor(BuildContext context) => isDark(context) ? CustomColors.GRAY_DARK : CustomColors.GRAY_LIGHT;
  Color blueColor(BuildContext context) => isDark(context) ? CustomColors.BLUE_LIGHT : CustomColors.BLUE_DARK;
  Color greenColor(BuildContext context) => isDark(context) ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK;
  Color yellowColor(BuildContext context) => isDark(context) ? CustomColors.YELLOW_LIGHT : CustomColors.YELLOW_DARK;
  Color redColor(BuildContext context) => isDark(context) ? CustomColors.RED_LIGHT : CustomColors.RED_DARK;

  /// INFO
  bool isDark(BuildContext context) => DeviceUtility.isDark(context);
  double getWidth(BuildContext context) => DeviceUtility.getDeviceWidth(context);
  double getHeight(BuildContext context) => DeviceUtility.getDeviceHeight(context);
  bool isTablet(BuildContext context) => getWidth(context) >= 650 && getWidth(context) < 1100;
  bool isMobile(BuildContext context) => getWidth(context) < 650;

}
