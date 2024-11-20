import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        title: Text('Animated Switcher'),
        backgroundColor: AppColors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isOn ? Icons.power : Icons.power_off,
                key: ValueKey<bool>(isOn),
                color: isOn ? Colors.green : Colors.grey,
                size: 100,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Text("Toggle Power"),
            ),
          ],
        ),
      ),
    );
  }
}
