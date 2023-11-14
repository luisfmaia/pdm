import 'package:e_food/entity/app_state.dart';
import 'package:e_food/screens/on_boarding.dart';
import 'package:e_food/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FOOD-E',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        fontFamily: 'BebasNeue',
      ),
      home: const OnBoarding(),
    );
  }
}
