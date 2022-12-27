import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTasks extends StatelessWidget {
  final String image;
  final String title;

  const CardTasks({super.key,
    required this.image,
    required this.title
  });

  static const allExercises = [
    CardTasks(image: 'assets/images/chest.jpeg', title: 'Chest'),
    CardTasks(image: 'assets/images/back.jpeg', title: 'Back'),
    CardTasks(image: 'assets/images/leg.jpeg', title: 'Legs'),
    CardTasks(image: 'assets/images/bicipites.webp', title: 'Biceps'),
    CardTasks(image: 'assets/images/triceps.webp', title: 'Triceps'),
    CardTasks(image: 'assets/images/shoulders.webp', title: 'Shoulders'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            height: 350,
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text('Basic',
                            style: GoogleFonts.overpass(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    decoration: TextDecoration.none))),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text('Expert',
                            style: GoogleFonts.overpass(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    decoration: TextDecoration.none))),
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Align(
                  alignment: FractionalOffset.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      title,
                      style: GoogleFonts.hindMadurai(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                              decoration: TextDecoration.none)),
                    ),
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
