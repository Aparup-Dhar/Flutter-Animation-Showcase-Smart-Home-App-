import 'package:flutter/material.dart';
import 'package:flutter_animation_assignment/colors.dart';

class AnimatedListExample extends StatefulWidget {
  @override
  _AnimatedListExampleState createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<String> devices = ["Light", "Fan", "Air Conditioner"];

  void _addDevice(String deviceName) {
    setState(() {
      devices.insert(0, deviceName);
      _listKey.currentState!.insertItem(0);
    });
  }

  void _removeDevice(int index) {
    String removedDevice = devices.removeAt(index);
    _listKey.currentState!.removeItem(index, (context, animation) {
      return ListTile(
        title: Text(removedDevice),
      );
    });
  }

  // Function to show the dialog for adding a device
  void _showAddDeviceDialog() {
    String deviceName = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.creme,
          title: Text('Enter Device Name'),
          content: TextField(
            onChanged: (value) {
              deviceName = value;
            },
            decoration: InputDecoration(hintText: 'Device name'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (deviceName.isNotEmpty) {
                  _addDevice(deviceName);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  // Function to get device icon based on the device name
  IconData _getDeviceIcon(String device) {
    switch (device) {
      case 'Light':
        return Icons.lightbulb;
      case 'Fan':
        return Icons.ac_unit;
      case 'Air Conditioner':
        return Icons.air;
      default:
        return Icons.devices;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellow,
      appBar: AppBar(
          title: Text('Animated List'),
        backgroundColor: AppColors.orange,
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: devices.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: Card(
              color: AppColors.creme,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              elevation: 5,
              child: ListTile(
                leading: Icon(_getDeviceIcon(devices[index])),
                title: Text(devices[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => _removeDevice(index),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.orange,
        onPressed: _showAddDeviceDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
