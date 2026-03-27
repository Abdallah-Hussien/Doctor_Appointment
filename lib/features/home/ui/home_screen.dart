// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:doc_app/core/helper/spacing.dart';
import 'package:doc_app/core/theme/styles.dart';

import 'package:flutter/material.dart';
import 'widgets/doctor_blue_container.dart';
import 'widgets/doctor_list/doctors_bloc_builder.dart';
import 'widgets/home_top_bar.dart';
import 'widgets/specialty_list/specialty_bloc_builder.dart';

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
            Expanded(
              child: Column(
                children: [
                  SpecialtyBlocBuilder(),
                  verticalSpace(20),
                  DoctorsBlocBuilder(),
                ],
              ),
            ),
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
