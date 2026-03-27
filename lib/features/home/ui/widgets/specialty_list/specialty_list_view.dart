import 'package:doc_app/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/cubit/home_cubit.dart';
import 'specialty_listview_item.dart';

class SpecialtyListView extends StatefulWidget {
  const SpecialtyListView({
    super.key,
    required this.specializationDataList,
  });
  final List<Specialization> specializationDataList;

  @override
  State<SpecialtyListView> createState() => _SpecialtyListViewState();
}

class _SpecialtyListViewState extends State<SpecialtyListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.specializationDataList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              context.read<HomeCubit>().emitDoctorList(index);
            },
            child: SpecialtyListViewItem(
              index: index,
              selectedSpeciality: selectedIndex,
              speciality: widget.specializationDataList[index],
            ),
          );
        },
      ),
    );
  }
}
