import 'package:flutter/material.dart';

class CardTasks extends StatelessWidget {
  const CardTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 300),
          child: Container(
            height: 350,
            width: 250,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod/images/701/articles/2017/02/30-min-bench-press1-1518563894.jpeg?crop=0.636xw:1xh;center,top&resize=640:*'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Text(
                    'Basic',
                    style: TextStyle(color: Colors.white, fontSize: 15, decoration: TextDecoration.none),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
