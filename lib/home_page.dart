import 'package:flutter/material.dart';
import 'package:gym_app/AllGymParts.dart';
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
  final controller = TextEditingController();
  List<CardTasks> exercises = CardTasks.allExercises;

  void searchParts(String query) {
    final suggestions = CardTasks.allExercises.where((part) {
      final gymPartTitle = part.title.toLowerCase();
      final input = query.toLowerCase();

      return gymPartTitle.contains(input);
    }).toList();

    setState(() {
      exercises = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      // bottomNavigationBar: Container(
      //   color: Colors.black,
      //   child: const Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //     child: GNav(
      //       backgroundColor: Colors.black,
      //       color: Colors.white,
      //       activeColor: Colors.white,
      //       tabBackgroundColor: Colors.white24,
      //       gap: 8,
      //       // onTabChange: (index) {
      //       //   print(index);
      //       // },
      //       padding: EdgeInsets.all(16),
      //       tabs: [
      //         GButton(
      //           icon: Icons.home,
      //           text: 'Home',
      //         ),
      //         GButton(icon: Icons.timer, text: 'Timer'),
      //         GButton(
      //           icon: Icons.task,
      //           text: 'Task',
      //         ),
      //         GButton(icon: Icons.person, text: 'Profile'),
      //       ],
      //     ),
      //   ),
      // ),
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
                const Expanded(
                    flex: 3,
                    child: SizedBox(width: 50)),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/iconHeart.webp'))),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: TextField(
                onChanged: searchParts,
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
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
                    prefixIcon:
                        Icon(Icons.search_rounded, color: Colors.white)),
              ),
            ),
            Row(
              children: [
                const Text(
                  'Collection',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 300,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const AllGymParts(title: 'All Muscle Groups')),
                    );
                  },
                  child: const Text(
                    'See All',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 370,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: exercises.length,
                itemBuilder: (BuildContext context, int index) {
                  final exercise = exercises[index];

                  return CardTasks(
                      image: exercise.image, title: exercise.title);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
