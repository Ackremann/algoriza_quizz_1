import 'package:algoriza_quizz_1/features/auth/presentation/pages/on_borading.dart';
import 'package:flutter/material.dart';

import 'config/routes/magic_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: const OnBoardingView(),
    );
  }
}
