import 'package:flutter/material.dart';
import 'package:gym_app/card_tasks.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:gym_app/timer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> parts = [
    'Chest',
    'Back',
    'Legs',
    'Biceps',
    'Triceps',
    'Shoulders'
  ];

  void _runFilter(String enteredWord) {
    if(enteredWord.isEmpty) {

    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white24,
            gap: 8,
            // onTabChange: (index) {
            //   print(index);
            // },
            padding: EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(icon: Icons.timer, text: 'Timer'),
              GButton(
                icon: Icons.task,
                text: 'Task',
              ),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Discover \nHow to shape \nThe body',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      height: 1.5),
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.red,
                      height: 10,
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                readOnly: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                    fillColor: Color.fromRGBO(37, 34, 45, 100),
                    filled: true,
                    prefixIcon: Icon(Icons.search_rounded, color: Colors.white)),
              ),
            ),
            Row(
              children: const [
                Text(
                  'Collection',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 300,
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 370,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CardTasks(image: 'assets/images/chest.jpeg', title: 'Chest'),
                  CardTasks(image: 'assets/images/back.jpeg', title: 'Back'),
                  CardTasks(image: 'assets/images/leg.jpeg', title: 'Legs'),
                  CardTasks(image: 'assets/images/bicipites.webp', title: 'Biceps'),
                  CardTasks(image: 'assets/images/triceps.webp', title: 'Triceps'),
                  CardTasks(image: 'assets/images/shoulders.webp', title: 'Shoulders'),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
