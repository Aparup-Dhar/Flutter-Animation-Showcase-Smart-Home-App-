import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedPhysicalModelExample extends StatefulWidget {
  @override
  _AnimatedPhysicalModelExampleState createState() =>
      _AnimatedPhysicalModelExampleState();
}

class _AnimatedPhysicalModelExampleState extends State<AnimatedPhysicalModelExample> {
  int selectedIndex = -1;  // To track the selected card's index

  // A list of card labels to display in the ListView
  final List<String> cardLabels = [
    "Option 1",
    "Option 2",
    "Option 3",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
          title: Text('Animated Physical Model'),
        backgroundColor: AppColors.orange,
      ),
      body: ListView.builder(
        itemCount: cardLabels.length,
        itemBuilder: (context, index) {
          // Determine if this card is selected
          bool isSelected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  // Toggle the selected card
                  selectedIndex = isSelected ? -1 : index;
                });
              },
              child: AnimatedPhysicalModel(
                duration: Duration(seconds: 1),
                color: Colors.white,  // Keep color fixed
                shadowColor: Colors.red,
                elevation: isSelected ? 50.0 : 5.0, // Increase elevation for selected card
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12), // Optional: Adds rounded corners
                child: Container(
                  color: AppColors.creme,
                  height: 150,
                  alignment: Alignment.center,
                  child: Text(
                    cardLabels[index],
                    style: TextStyle(fontSize: 24, color: Colors.black),  // Keep text color fixed
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
