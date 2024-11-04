import 'package:bitsgap_tt/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  final Widget icon;
  final double circleSize;
  final void Function()? onPressed;

  const AppElevatedButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.circleSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: circleSize,
      height: circleSize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          foregroundColor: AppColors.grey,
          backgroundColor: AppColors.whiteSmoke,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
