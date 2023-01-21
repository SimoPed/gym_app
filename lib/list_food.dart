import 'package:flutter/material.dart';

class ListFood extends StatefulWidget {
  final String title;

  const ListFood({super.key, required this.title});

  @override
  State<ListFood> createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
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
              //Lista di piatti con firebase
            ],
          ),
        ));
  }
}
