import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTasks extends StatelessWidget {
  const CardTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Positioned(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'CHEST',
                        style: GoogleFonts.hindMadurai(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                decoration: TextDecoration.none)),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
