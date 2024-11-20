import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

//Animated Container + Animated Cross Fade
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double temperature = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
        title: Text('Animated Container'),
        backgroundColor: AppColors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: temperature > 25 ? Colors.redAccent : Colors.blueAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center( // Center the Row inside the AnimatedContainer
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Shrink the Row to its content
                  children: [
                    AnimatedCrossFade(
                      duration: const Duration(seconds: 1),
                      crossFadeState: temperature > 25
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                        size: 30,
                      ),
                      secondChild: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "${temperature.toStringAsFixed(1)}°C",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              child: Slider(
                thumbColor: Colors.blueGrey,
                activeColor: Colors.blueGrey,
                value: temperature,
                min: 15,
                max: 35,
                onChanged: (value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
