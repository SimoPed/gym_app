import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/read_data/get_name_food.dart';

class ListFood extends StatefulWidget {
  final String title;

  const ListFood({super.key, required this.title});

  @override
  State<ListFood> createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  List<String> docIds = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
        .collection('Food')
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
          title: Text(widget.title),
          backgroundColor: Colors.black,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.orange],
                tileMode: TileMode.mirror),
          ),
          child: Column(
            children: [
              const Text(
                'For a healthy diet',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(child: FutureBuilder(
                  future: getDocId(),
                  builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIds.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: GetNameFood(documentId: docIds[index])
                      );
                    });
              }))
            ],
          ),
        ));
  }
}
