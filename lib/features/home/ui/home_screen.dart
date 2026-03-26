// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:doc_app/core/helper/spacing.dart';
import 'package:doc_app/core/theme/colors.dart';
import 'package:doc_app/core/theme/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/models/home_response.dart';
import '../logic/cubit/home_cubit.dart';
import 'widgets/doctor_blue_container.dart';
import 'widgets/doctor_list/recommendation_doctor_list.dart';
import 'widgets/doctor_list/doctor_speciality_list.dart';
import 'widgets/home_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
          20.0,
          16.0,
          20.0,
          28.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeTopBar(
              name: 'Abdallah',
              pressNotificationIcon: () {},
            ),
            DoctorBlueContainer(
              pressFindNearby: () {},
            ),
            verticalSpace(18),
            doctorCategory(
              title: 'Doctor Speciality',
              onPressed: () {},
            ),
            verticalSpace(8),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) {
                return current is Loading ||
                    current is Success ||
                    current is Error;
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () {
                    return Center(
                        child: CircularProgressIndicator(
                      color: ColorsManager.mainBlue,
                    ));
                  },
                  success: (data) {
                    final response = data as HomeResponse;
                    log(data.toString(), name: 'ggg');
                    return Expanded(
                      child: Column(
                        children: [
                          DoctorSpecialityList(
                            specializationDataList: response.data,
                          ),
                          verticalSpace(20),
                          doctorCategory(
                            title: 'Recommendation Doctor',
                            onPressed: () {},
                          ),
                          verticalSpace(16),
                          RecommendationDoctorList(
                            doctorList: response.data[0].doctors,
                          )
                        ],
                      ),
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
            )
          ],
        ),
      )),
    );
  }

  Row doctorCategory({required String title, required VoidCallback onPressed}) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'see all',
            style: TextStyles.font13BlueRegular,
          ),
        ),
      ],
    );
  }
}
