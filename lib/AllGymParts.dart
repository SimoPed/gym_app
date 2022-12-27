import 'package:flutter/material.dart';

import 'card_tasks.dart';

class AllGymParts extends StatefulWidget {
  const AllGymParts({super.key, required this.title});

  final String title;

  @override
  State<AllGymParts> createState() => _AllGymPartsState();
}

class _AllGymPartsState extends State<AllGymParts> {

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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
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
                  prefixIcon: Icon(
                      Icons.search_rounded, color: Colors.white)),
            ),
          ),
        ]
      ),
    );
  }
}
