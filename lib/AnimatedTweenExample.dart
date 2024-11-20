import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedTweenExample extends StatefulWidget {
  @override
  _AnimatedTweenExampleState createState() => _AnimatedTweenExampleState();
}

class _AnimatedTweenExampleState extends State<AnimatedTweenExample> {
  double _circleSize = 200;  // Initial size of the circle set to 200
  double _rangeValue = 25;   // Initial range value (25m)

  // Function to handle the button press
  void _expandCircle() {
    setState(() {
      // Toggle between two sizes and change the range value accordingly
      if (_circleSize == 200) {
        _circleSize = 300;  // Expand to a larger size
        _rangeValue = 50;   // Set range value to 50m when further expanded
      } else {
        _circleSize = 200;  // Contract back to the initial larger size
        _rangeValue = 25;   // Set range value to 25m when contracted
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
          title: Text('Animated Tween'),
      backgroundColor: AppColors.orange,),
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 200, end: _circleSize),  // Use the dynamic size
          duration: Duration(seconds: 2),
          builder: (context, value, child) {
            return Container(
              height: value,
              width: value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,  // Make it a circle
                color: AppColors.orange,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.wind_power, color: Colors.black, size: 50),  // Icon in the center
                    SizedBox(height: 10),
                    Text(
                      'Range: ${_rangeValue == 25 ? "25m" : "50m"}',  // Update text using ternary operator
                      style: TextStyle(
                        color: Colors.black,  // Same color as the circle
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        onPressed: _expandCircle,
        child: Icon(Icons.expand),  // Icon for the FAB
      ),
    );
  }
}
