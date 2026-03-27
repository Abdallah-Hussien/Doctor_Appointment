import 'package:doc_app/features/home/data/models/home_response.dart';
import 'package:flutter/material.dart';

import 'doctors_listview_item.dart';


class DoctorsListView extends StatelessWidget {
  const DoctorsListView({
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
          return DoctorsListViewItem(
            doctorModel: doctorList[index],
          );
        },
      ),
    );
  }
}

