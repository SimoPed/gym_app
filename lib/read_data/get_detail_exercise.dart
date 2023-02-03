import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDetailExercise extends StatelessWidget {
  final String documentId;

  const GetDetailExercise({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference exercise = FirebaseFirestore.instance.collection('Exercises');

    return FutureBuilder<DocumentSnapshot>(
      future: exercise.doc(documentId).get(),
      builder: ( context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Padding(
            padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:
                  DecorationImage(image: NetworkImage('${data['image']}'), fit: BoxFit.cover)),
              child:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.grey.withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        '${data['description']}',
                        style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          );
          }

              return const Text("loading");
        },
    );
  }
}
