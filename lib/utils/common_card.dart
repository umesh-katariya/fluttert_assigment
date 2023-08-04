import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class CommonCard extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final double? radius;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  const CommonCard({Key? key,required this.child,this.bgColor,this.radius,this.elevation,this.margin,this.padding,this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation??6,
      margin: margin,
      color: bgColor??AppColors.cardBackgroundColor,
      shadowColor: AppColors.cardShadowColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius??2.r)),
      child: Container(
        padding: padding,
          decoration : decoration!=null?decoration!.copyWith(borderRadius: BorderRadius.circular(radius??2.r)):null,
          child: child),
    );
  }
}
