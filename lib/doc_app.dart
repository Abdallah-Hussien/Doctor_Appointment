// ignore_for_file: prefer_const_constructors

import 'package:doc_app/core/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor Appointment',
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
