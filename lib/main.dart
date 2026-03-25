import 'package:doc_app/core/routing/router.dart';
import 'package:doc_app/doc_app.dart';
import 'package:flutter/material.dart';

import 'core/di/dependancy_injection.dart';

void main() {
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}
