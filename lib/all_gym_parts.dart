import 'package:flutter/material.dart';
import 'package:gym_app/details_exercises.dart';
import 'package:gym_app/muscle_group_card.dart';

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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 10),
                    child: InkWell(
                        child: MuscleGroupCard(titleCard: CardTasks.allExercises[0].title, imageCard: CardTasks.allExercises[0].image),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              DetailsExercises()),
                        );
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 10),
                      child: MuscleGroupCard(titleCard: CardTasks.allExercises[1].title, imageCard: CardTasks.allExercises[1].image)
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 10),
                    child: MuscleGroupCard(titleCard: CardTasks.allExercises[2].title, imageCard: CardTasks.allExercises[2].image)
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 10),
                    child: MuscleGroupCard(titleCard: CardTasks.allExercises[3].title, imageCard: CardTasks.allExercises[3].image)
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 10),
                    child: MuscleGroupCard(titleCard: CardTasks.allExercises[4].title, imageCard: CardTasks.allExercises[4].image)
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 10),
                    child: MuscleGroupCard(titleCard: CardTasks.allExercises[5].title, imageCard: CardTasks.allExercises[5].image)
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 10),
                      child: MuscleGroupCard(titleCard: CardTasks.allExercises[4].title, imageCard: CardTasks.allExercises[4].image)
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 8, left: 10),
                      child: MuscleGroupCard(titleCard: CardTasks.allExercises[5].title, imageCard: CardTasks.allExercises[5].image)
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
