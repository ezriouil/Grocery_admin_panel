import 'package:flutter/material.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:grocery_admin_panel/utils/state/custom_state.dart';

import '../../utils/constants/custom_colors.dart';
import '../../utils/constants/custom_sizes.dart';

class CustomStatistic extends CustomState {
  final double progress, maxProgress;
  final Color color;
  final String name;
  final int size;
  final GestureTapCallback onClick;

  const CustomStatistic({super.key, required this.name, required this.size, required this.progress, required this.maxProgress, required this.color, required this.onClick});

  @override
  Widget execute(BuildContext context) {
    final ValueNotifier<double> valueNotifier = ValueNotifier(0);
    return Container(
      height: 140,
      decoration: BoxDecoration(color: color.withOpacity(0.3), borderRadius: BorderRadius.circular(CustomSizes.SPACE_DEFAULT)),
      padding: const EdgeInsets.only(top:CustomSizes.SPACE_BETWEEN_ITEMS/2),
      child: InkWell(
        onTap: onClick,
        borderRadius: BorderRadius.circular(90),
        child: DashedCircularProgressBar.aspectRatio(
          aspectRatio: 1,
          valueNotifier: valueNotifier,
          progress: progress,
          maxProgress: maxProgress,
          startAngle: 225,
          sweepAngle: 270,
          foregroundColor: color,
          backgroundColor: color.withOpacity(0.4),
          animationDuration: const Duration(milliseconds: 4000),
          animationCurve: Curves.elasticInOut,
          foregroundStrokeWidth: 6,
          backgroundStrokeWidth: 12,
          animation: true,
          seekSize: 3,
          seekColor: CustomColors.WHITE,
          child: Center(
            child: ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (_, double value, __) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/line_chart.png", width: 30, height: 30,color: color.withOpacity(0.4)),
                      Text(name, style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12)),
                      Text(size < 10 ? "0$size" : size.toString(), style: Theme.of(context).textTheme.headlineMedium),
                    ])
            ),
          ),
        ),
      ),
    );
  }
}