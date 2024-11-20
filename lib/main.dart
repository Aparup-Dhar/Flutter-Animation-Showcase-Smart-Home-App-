import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/AnimatedBuilderExample.dart';
import 'package:flutter_animation_assignment/AnimatedContainerExample.dart';
import 'package:flutter_animation_assignment/AnimatedListExample.dart';
import 'package:flutter_animation_assignment/AnimatedPhysicalModelExample.dart';
import 'package:flutter_animation_assignment/AnimatedOpacityExample.dart';
import 'package:flutter_animation_assignment/AnimatedSwitcherExample.dart';
import 'package:flutter_animation_assignment/AnimatedTweenExample.dart';
import 'package:flutter_animation_assignment/colors.dart';
import 'HomeScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SideMenu(),
    );
  }
}

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Home App"),
        backgroundColor: AppColors.orange,
      ),
      drawer: Drawer(
        backgroundColor: AppColors.creme,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.orange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150'), // Replace with your image URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    "User Name",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Temperature"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedContainerExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.power),
              title: Text("Device Power Toggle"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedSwitcherExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text("Light Adjustment"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedOpacityExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.edit_document),
              title: Text("Plan Options"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedPhysicalModelExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.device_hub),
              title: Text("Add Device"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedListExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.wind_power),
              title: Text("Increase Range"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedTweenExample()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.flash_on),
              title: Text("Energy Use"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AnimatedBuilderExample()),
                );
              },
            ),
          ],
        ),
      ),
      body: HomeScreen()
    );
  }
}


