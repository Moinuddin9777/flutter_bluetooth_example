// import 'package:awesome_icons/awesome_icons.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_plus/gen/flutterblueplus.pb.dart';
import 'package:flutter_bluetooth_example/area_scan_ui_page.dart';
import 'package:flutter_bluetooth_example/circular_widgets_example.dart';
import 'package:flutter_bluetooth_example/scan_devices_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// void checkBluetoothState() {
//   FlutterBluePlus.instance.state;

//   StreamBuilder<BluetoothState>(
//     builder: (context, snapshot) {
//       final state = snapshot.data;
//       return SizedBox();
//     },
//   );
// }

FlutterBluePlus bluetoothInstance = FlutterBluePlus.instance;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(children: [
          Text(''),
          SizedBox(),
          ElevatedButton.icon(
              onPressed: () async {
                await bluetoothInstance.isOn
                    ? Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScanDevicesPage()))
                    : showBluetoothIsOffBanner(context);
              },
              icon: FaIcon(FontAwesomeIcons.bluetooth),
              label: Text('Scan for devices')),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScanPageTwo()));
              },
              icon: FaIcon(FontAwesomeIcons.penRuler),
              label: Text('Layout')),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ExamplePage()));
              },
              icon: FaIcon(FontAwesomeIcons.penRuler),
              label: Text('Layout')),
        ]),
      ),
    );
  }
}

Future<dynamic> showBluetoothIsOffBanner(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: Text(
                "Bluetooth is turned off. Please turn on for a better experience"),
            actions: [
              ElevatedButton.icon(
                  onPressed: () {
                    if (Platform.isAndroid) {
                      FlutterBluePlus.instance.turnOn();
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Bluetooth Turned On')));
                    } else {
                      null;
                    }
                  },
                  label: Text('Turn On'),
                  icon: FaIcon(FontAwesomeIcons.bluetooth)),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: FaIcon(FontAwesomeIcons.xmark)),
            ],
          ));
}
