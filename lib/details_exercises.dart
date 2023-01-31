import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DetailsExercises extends StatefulWidget {
  const DetailsExercises({Key? key}) : super(key: key);

  @override
  State<DetailsExercises> createState() => _DetailsExercisesState();
}

class _DetailsExercisesState extends State<DetailsExercises> {

  late QuerySnapshot querySnapshot;

  @override
  void initState() {
    super.initState();
    getDetailsExercises().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _showDetailExercises(),
    );
  }

  Widget _showDetailExercises() {
    if(querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.docs.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
//load data into widgets
              Text("${querySnapshot.docs[i].data()}"),
            ],
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  getDetailsExercises() async {
    return await FirebaseFirestore.instance.collection('Exercises').snapshots();
  }

}
