import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class DoctorBlueContainer extends StatelessWidget {
  const DoctorBlueContainer({super.key, required this.pressFindNearby});
  final VoidCallback pressFindNearby;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 193.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 165.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home_blue_pattern.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and\nschedule with\nnearest doctor',
                  style: TextStyles.font18WhiteMedium,
                ),
                verticalSpace(6),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      backgroundColor: ColorsManager.lighterGray,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23),
                      )),
                  onPressed: pressFindNearby,
                  child: Text(
                    'Find Nearby',
                    style: TextStyles.font12BlueRegular,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 12.w,
            top: 0,
            child: Image.asset(
              'assets/images/home_doctor.png',
              height: 200.h,
            ),
          ),
        ],
      ),
    );
  }
}
