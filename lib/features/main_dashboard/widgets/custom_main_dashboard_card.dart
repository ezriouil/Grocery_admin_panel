import 'package:flutter/material.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/custom_sizes.dart';

class CustomMainDashboardCard extends CustomState {
  final String title, subTitle;
  final GestureTapCallback onClick;
  final IconData icon;

  const CustomMainDashboardCard({super.key, required this.title, required this.subTitle, required this.onClick, required this.icon});

  @override
  Widget execute(BuildContext context) {
    return InkWell(
      onTap: onClick,
      borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: CustomSizes.SPACE_BETWEEN_ITEMS / 4,
        shadowColor: primaryColor(context),
        color: primaryColor(context),
        child: Container(
          padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
          width: getWidth(context),
          height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 60, height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS), border: Border.all(color: darkDarkLightLightColor(context)), color: darkDarkLightLightColor(context)),
                    child: Icon(icon, color: primaryColor(context))
                  ),
                  Transform.rotate(angle: 0.7,child: Icon(Iconsax.direct_up, color: darkDarkLightLightColor(context)))
                ],
              ),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
              Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: darkDarkLightLightColor(context), letterSpacing: 1.0, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
              Text("Here You Can Manage Your Stores & Adding New Stores", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: grayColor(context), fontSize: 12.0)),
            ],
          ),
        ),
      ),
    );
  }
}
