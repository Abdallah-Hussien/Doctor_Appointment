import 'package:doc_app/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class DoctorSpecialityList extends StatelessWidget {
  const DoctorSpecialityList({
    super.key,
    required this.specializationDataList,
  });
  final List<Specialization> specializationDataList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityListItem(
            index: index,
            name: specializationDataList[index].name,
          );
        },
      ),
    );
  }
}

class DoctorSpecialityListItem extends StatelessWidget {
  const DoctorSpecialityListItem({
    super.key,
    required this.index,
    required this.name,
    this.imgUrl,
  });
  final int index;
  final String? name;
  final String? imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: index == 0 ? 0 : 16.w,
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.lighterGray,
            radius: 25,
            child: SvgPicture.asset(
              imgUrl ?? 'assets/svgs/general_speciality.svg',
              height: 40.h,
              width: 40.w,
            ),
          ),
          verticalSpace(5),
          Text(
            name ?? 'Speciality',
            style: TextStyles.font12DarkBlueRegular,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
