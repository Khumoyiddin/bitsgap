import 'package:bitsgap_tt/presentation/core/app_assets.dart';
import 'package:bitsgap_tt/presentation/core/app_colors.dart';
import 'package:flutter/material.dart';

class AppImageNetwork extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;

  const AppImageNetwork(this.src, {super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src ?? 'no image, using default Rick\'s image',
      width: width,
      height: height,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(color: AppColors.irisBlue),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(PngAssets.rick);
      },
    );
  }
}
