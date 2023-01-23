import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetNameFood extends StatelessWidget {
  final String documentId;

  const GetNameFood({super.key, required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference food = FirebaseFirestore.instance.collection('Food');

    return FutureBuilder<DocumentSnapshot>(
        future: food.doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(children: [
              Text(
                '${data['name']}',
                style: const TextStyle(color: Colors.white),
              ),
              Container(
                width: 50,
                height: 50,
                child: Image.network('${data['image']}'),
              )
            ]);
          }
          return const Text('Loading...');
        });
  }
}
