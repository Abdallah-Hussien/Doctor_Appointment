import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/home_cubit.dart';
import 'doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      
      builder: (context, state) {
        if (state is DoctorSuccess) {
          return DoctorsListView(
            doctorList: state.doctorsList,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}