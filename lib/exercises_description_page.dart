import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExercisesDescriptionPage extends StatelessWidget {
  final QueryDocumentSnapshot doc;
  final Function()? onTap;

  const ExercisesDescriptionPage({super.key, required this.doc, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(image: DecorationImage(image: doc['image'])),
          ),
          Text(doc['description'])
        ],
      ),
    );
  }
}
