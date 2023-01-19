import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  final String title;

  const Timer({super.key, required this.title});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {

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
      ),
    );
  }
}
