import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    // timer = Timer.
  }
}

  Widget buildButtons() {
    return ElevatedButton(
      onPressed: startTimer(),
      child: Text('Start'),
    );
  }

  Widget buildTime() {
    return Text(
      '$seconds',
      style: const TextStyle(
          decoration: TextDecoration.none,
          color: Colors.red,
          fontSize: 50
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          buildTime(),
          SizedBox(
            width: 200,
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  strokeWidth: 10,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                  backgroundColor: Colors.green,
                )
              ],
            ),
          ),
          buildButtons()
        ],
      ),
    );
  }
