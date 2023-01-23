import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gym_app/card_tasks.dart';
import 'package:gym_app/food_card.dart';
import 'package:gym_app/list_food.dart';
import 'package:gym_app/nav_bar.dart';
import 'package:gym_app/timer.dart';
import 'all_gym_parts.dart';
import 'firebase_options.dart';
import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      // CardTasks()
      // HomePage(title: 'Home'),
      // FoodCard(),
      ListFood(title: 'Food'),
      // SecondPage(),
      // AllGymParts(title: 'All Muscle Groups',),
    );
  }
}