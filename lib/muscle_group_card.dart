import 'package:flutter/material.dart';

class MuscleGroupCard extends StatelessWidget {

  final String titleCard;
  final String imageCard;

  const MuscleGroupCard({Key? key, required this.titleCard, required this.imageCard}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(imageCard),
              fit: BoxFit.cover,
              opacity: 0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titleCard,
            style: const TextStyle(
                fontSize: 30, color: Colors.white),
          )
        ],
      ),
    );
  }
}
