import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_assets.dart';
import '../app_colors.dart';
import '../app_styles.dart';
import '../app_utils.dart';

import '../constants.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 0.7.sw,
      backgroundColor: AppColors.primaryColor,
      child: Column(
        children: [
          40.h.height(),
          Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.asset(AppAssets.icLogo,width: double.infinity,height: 120.h,))),
          5.h.height(),
          Text(Constants.appLabelName,style: AppStyles.whiteBold16,),
          5.h.height(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 5.h),
              children: [
                /*drawerItemWithSvg(
                    onTap: () {
                      Get.back();
                    },
                    icon: AppAssets.homeIcon,
                    title: LanguageConstant.home.tr),*/
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItemDivider() {
    return Container(
      height: 0.8.h,
      width: double.infinity,
      color: AppColors.greyColor.withOpacity(0.5),
    );
  }

  Widget drawerItemWithSvg(
      {Function()? onTap, required String icon, required String title}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                width: 25.w,
                child: SvgPicture.asset(
                  icon,
                  height: 25.sp,
                  width: 25.sp,
                  color: AppColors.whiteColor,
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: AppStyles.whiteRegular16,
            )
          ],
        ),
      ),
    );
  }

}
