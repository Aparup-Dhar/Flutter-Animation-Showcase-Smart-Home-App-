import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedOpacityExample extends StatefulWidget {
  @override
  _AnimatedGlowExampleState createState() => _AnimatedGlowExampleState();
}

class _AnimatedGlowExampleState extends State<AnimatedOpacityExample> {
  double glowOpacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
          title: Text('Animated Glow Effect'),
        backgroundColor: AppColors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Glow effect
                AnimatedOpacity(
                  opacity: glowOpacity,
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellowAccent.withOpacity(0.4), // Glow color
                          blurRadius: 50, // Spread of the glow
                          spreadRadius: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                // Icon (does not fade)
                Icon(Icons.lightbulb, size: 100, color: Colors.yellow),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              child: Slider(
                value: glowOpacity,
                thumbColor: Colors.red,
                activeColor: Colors.red,
                min: 0,
                max: 1,
                onChanged: (value) {
                  setState(() {
                    glowOpacity = value;
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
