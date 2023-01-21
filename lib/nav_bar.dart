import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/all_gym_parts.dart';
import 'package:gym_app/home_page.dart';
import 'package:gym_app/list_food.dart';
import 'package:gym_app/timer.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = [
    const HomePage(title: 'Home'),
    const ListFood(title: 'Food'),
    const Timer(title: 'Timer')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_page],
      bottomNavigationBar: CurvedNavigationBar(
      color: Colors.black,
      key: _bottomNavigationKey,
      backgroundColor: Colors.orange,
      items: const [
        Icon(Icons.task_outlined, size: 30, color: Colors.white),
        Icon(Icons.food_bank_outlined, size: 30, color: Colors.white),
        Icon(Icons.timer_outlined, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
      ),
    );
  }
}
