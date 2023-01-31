import 'package:flutter/material.dart';
import 'package:gym_app/custom_button.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Timer extends StatefulWidget {
  final String title;

  const Timer({super.key, required this.title});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  final _isHours = true;

  @override
  void dispose() {
    super.dispose();
    _stopWatchTimer.dispose();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
                stream: _stopWatchTimer.rawTime,
                initialData: _stopWatchTimer.rawTime.value,
                builder: (context, snapshot) {
                  final value = snapshot.data;
                  final displayTime =
                      StopWatchTimer.getDisplayTime(value!, minute: _isHours);
                  return Text(
                    displayTime,
                    style: const TextStyle(fontSize: 65, color: Colors.white),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    color: Colors.green,
                    label: 'Start',
                    onPressed: () {
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: CustomButton(
                      color: Colors.red,
                      label: 'Stop',
                      onPressed: () {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // CustomButton(
            //   color: Colors.blue,
            //   label: 'Lap',
            //   onPressed: () {
            //     _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CustomButton(
                color: Colors.black,
                label: 'Reset',
                onPressed: () {
                  _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
