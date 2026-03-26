import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/styles.dart';

class RecommendationDoctorList extends StatelessWidget {
  const RecommendationDoctorList({
    super.key,
    required this.doctorList,
  });
  final List<Doctor> doctorList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctorList.length,
        itemBuilder: (context, index) {
          return RecommendationDoctorListItem(
            doctorModel: doctorList[index],
          );
        },
      ),
    );
  }
}

class RecommendationDoctorListItem extends StatelessWidget {
  const RecommendationDoctorListItem({
    super.key,
    required this.doctorModel,
  });
  final Doctor doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/onboarding_doctor.png',
              width: 110.w,
              height: 110.h,
              fit: BoxFit.contain,
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name ?? "Doctor Name",
                  style: TextStyles.font18DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  doctorModel.email ?? "Doctor email",
                  style: TextStyles.font13GrayRegular,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  doctorModel.phone ?? "Doctor Phone",
                  style: TextStyles.font13GrayRegular,
                  overflow: TextOverflow.ellipsis,
                ),
                Text.rich(
                  TextSpan(
                    style: TextStyles.font13GrayRegular.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    children: [
                      TextSpan(text: doctorModel.degree ?? 'degree'),
                      const TextSpan(
                          text: " in ",
                          style: TextStyle(color: ColorsManager.mainBlue)),
                      TextSpan(
                          text: doctorModel.specialization.name ??
                              'specialization'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
