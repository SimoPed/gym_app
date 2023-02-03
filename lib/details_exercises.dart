import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/read_data/get_detail_exercise.dart';

class DetailsExercises extends StatefulWidget {
  const DetailsExercises({Key? key}) : super(key: key);

  @override
  State<DetailsExercises> createState() => _DetailsExercisesState();
}

class _DetailsExercisesState extends State<DetailsExercises> {
  List<String> docIds = [];

  Future getEsId() async {
    await FirebaseFirestore.instance
        .collection('Exercises')
        .get()
        .then((snapshot) =>
        snapshot.docs.forEach((document) {
          print(document.reference);
          docIds.add(document.reference.id);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Exercises'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getEsId(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: docIds.length,
                      itemBuilder: (context, index) {
                        return GetDetailExercise(documentId: docIds[index]);
                      });
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  // Widget _showDetailExercises() {
  //   if (querySnapshot != null) {
  //     return ListView.builder(
  //       primary: false,
  //       itemCount: querySnapshot?.docs.length,
  //       padding: const EdgeInsets.all(12),
  //       itemBuilder: (context, i) {
  //         return Column(
  //           children: <Widget>[
  //             //load data into widgets
  //             Text("${querySnapshot?.docs[i].data()}"),
  //           ],
  //         );
  //       },
  //     );
  //   } else {
  //     return const Center(
  //       child: CircularProgressIndicator(),
  //     );
  //   }
  // }

  // getDetailsExercises() async {
  //   return FirebaseFirestore.instance.collection('Exercises').doc("description");
  // }
}
