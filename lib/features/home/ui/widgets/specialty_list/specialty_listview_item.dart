import 'package:doc_app/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
class SpecialtyListViewItem extends StatelessWidget {
  const SpecialtyListViewItem({
    super.key,
    required this.index,
    required this.selectedSpeciality,
    required this.speciality,
  });
  final int index;
  final int selectedSpeciality;
  final Specialization speciality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0 : 16.w,
      ),
      child: Column(
        children: [
          selectedSpeciality == index
              ? Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.mainBlue,
                    width: 2
                  )
                ),
                child: CircleAvatar(
                    backgroundColor: ColorsManager.lighterGray,
                    radius: 28,
                    child: Image.asset(
                      'assets/images/brain.png',
                      height: 43.h,
                      width: 43.w,
                    ),
                  ),
              )
              : CircleAvatar(
                  backgroundColor: ColorsManager.lighterGray,
                  radius: 28,
                  child: Image.asset(
                    'assets/images/brain.png',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
          verticalSpace(5),
          Text(
            speciality.name,
            style: selectedSpeciality == index
                ? TextStyles.font14BlueSemiBold
                : TextStyles.font12DarkBlueRegular,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
