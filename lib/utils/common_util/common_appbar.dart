import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import '../app_styles.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {

  bool showBack;
  bool centerTitle;
  String title;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  List<Widget>? actions;

  CommonAppBar({Key? key, required this.title,this.showBack=false,this.scaffoldKey,this.actions,this.centerTitle: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          if(showBack){
            Get.back();
          }else {
            if(scaffoldKey!=null){
              scaffoldKey!.currentState!.openDrawer();
            }
          }
        },
        child: Container(
          alignment: Alignment.center,
            child: showBack?
                const Icon(Icons.arrow_back,color: AppColors.whiteColor,)
            :SvgPicture.asset(AppAssets.menuIcon,height: 30.h,color: AppColors.whiteColor)),
      ),
      titleSpacing: 0,
      title: Text(
        title,
        style: AppStyles.whiteBold18,
      ),
      actions: actions,
      centerTitle: centerTitle,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
