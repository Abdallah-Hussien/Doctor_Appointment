import 'package:doc_app/core/helper/shared_constants.dart';
import 'package:doc_app/core/routing/router.dart';
import 'package:doc_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'core/di/dependancy_injection.dart';
import 'core/helper/shared_pref_helper.dart';

bool isUerLoggedIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  await checkIfUerLoggedIn();
  runApp(DocApp(appRouter: AppRouter()));
}

checkIfUerLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString(
    key: SharedConstants.userToken,
  );

  if (userToken == null || userToken.isEmpty) {
    isUerLoggedIn = false;
  } else {
    isUerLoggedIn = true;
  }
}
