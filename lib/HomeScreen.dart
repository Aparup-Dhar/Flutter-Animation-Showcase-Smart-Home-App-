import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              Text(
                'Good Morning, User!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(height: 8),

              // Smart Devices Section
              Text(
                'Your Devices',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              // Row for smart device cards, all expanded equally
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: _deviceCard('Lights', Icons.lightbulb, Colors.yellow, 'Turn on')),
                  SizedBox(width: 16), // Space between cards
                  Expanded(child: _deviceCard('Temp', Icons.thermostat, Colors.blue, 'Set Temp')),
                  SizedBox(width: 16), // Space between cards
                  Expanded(child: _deviceCard('Camera', Icons.camera_alt, Colors.red, 'View Feed')),
                ],
              ),
              SizedBox(height: 20),

              // Energy Stats Section
              Text(
                'Energy Usage',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _energyUsageCard(),
              SizedBox(height: 20),

              // Quick Actions Section
              Text(
                'Quick Actions',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              _quickActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // Device Card Widget
  Widget _deviceCard(String title, IconData icon, Color color, String action) {
    return Card(
      color: AppColors.creme,
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(action, style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  // Energy Usage Card Widget
  Widget _energyUsageCard() {
    return Card(
      color: AppColors.creme,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total Usage', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text(
                  '120 kWh',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('Monthly Usage', style: TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.flash_on, size: 40, color: Colors.yellow),
                SizedBox(height: 8),
                Text(
                  'Energy Status',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text('Normal', style: TextStyle(color: Colors.green)),
              ],
            ),
          ],
        ),
      ),
    );
  }


// Quick Action Buttons
  Widget _quickActionButtons() {
    return Card(
      color: AppColors.creme,

      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Actions',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _quickActionButton('Security', Icons.lock, Colors.blue),
                _quickActionButton('Lights', Icons.lightbulb, Colors.yellow),
                _quickActionButton('Air Conditioning', Icons.ac_unit, Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Quick Action Button Widget
  Widget _quickActionButton(String title, IconData icon, Color color) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 40, color: color),
          onPressed: () {
            // Handle quick action button press
          },
        ),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
