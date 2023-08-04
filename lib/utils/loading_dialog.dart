import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

showLoader() {
  return showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: Dialog(
            insetPadding: EdgeInsets.all(0.4.sw),
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            child: Container(
              decoration: BoxDecoration(
                //color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.circular(7.r),
              ),
              width: 60.w,
              height: 60.w,
              child: SpinKitSpinningLines(
                color: AppColors.whiteColor,
                size: 40.h,
              ),
            ),
          ),
        );
      });
}

hideLoader(){
  Get.back();
}


