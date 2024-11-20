import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedBuilderExample extends StatefulWidget {
  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample> {
  double energyUsage = 50.0; // Initial energy usage

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
          title: Text('Animated Builder'),
      backgroundColor: AppColors.orange,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lightning icon and energy usage text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flash_on, // Lightning icon
                  color: Colors.yellow,
                  size: 40,
                ),
                SizedBox(width: 10),
                Center(
                  child: Text(
                    'Energy Use : ${energyUsage.toStringAsFixed(0)} W', // Energy usage in watts
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Animated energy bar
            AnimatedBuilder(
              animation: AlwaysStoppedAnimation(energyUsage),
              builder: (context, child) {
                return Container(
                  height: energyUsage,
                  width: 150,
                  color: Colors.yellow,
                  alignment: Alignment.bottomCenter,
                );
              },
            ),
            SizedBox(height: 20),
            // Slider to control energy usage
            Container(
              width: 200,
              child: Slider(
                thumbColor: Colors.red,
                activeColor: Colors.red,
                value: energyUsage,
                min: 0,
                max: 200,
                onChanged: (value) {
                  setState(() {
                    energyUsage = value;
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
