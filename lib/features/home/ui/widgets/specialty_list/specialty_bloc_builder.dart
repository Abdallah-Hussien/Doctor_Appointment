import 'package:doc_app/features/home/ui/widgets/specialty_list/specialty_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../logic/cubit/home_cubit.dart';
import '../doctor_list/doctors_shimmer.dart';
import 'specialty_list_view.dart';

class SpecialtyBlocBuilder extends StatelessWidget {
  const SpecialtyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is Loading || current is Success || current is Error;
      },
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Expanded(
              child: Column(
                children: [
                  const SpecialtyShimmer(),
                  verticalSpace(12),
                  const DoctorsShimmer()
                ],
              ),
            );
          },
          success: (specialityList) {
            return SpecialtyListView(
              specializationDataList: specialityList,
            );
          },
          error: (error) {
            return Container(
              width: 100.w,
              height: 100.h,
              color: Colors.red,
              child: Text(error),
            );
          },
          orElse: () {
            return Container(
              width: 100.w,
              height: 100.h,
              color: Colors.amber,
            );
          },
        );
      },
    );
  }
}
