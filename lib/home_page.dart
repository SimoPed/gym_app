import 'package:flutter/material.dart';
import 'package:gym_app/card_tasks.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
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

                children: [
                  CardTasks(),
                  CardTasks(),
                  CardTasks(),
                  CardTasks(),
                  CardTasks(),
                ],

              ),
            )
          ],
        ),
      ),
    );
  }
}
