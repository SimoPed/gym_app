import 'package:flutter/material.dart';
import 'package:gym_app/card_tasks.dart';
import 'package:gym_app/timer.dart';
import 'home_page.dart';

void main() {
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
      home: const
      // CardTasks()
      HomePage(title: 'Home'),
      // Timer()
    );
  }
}