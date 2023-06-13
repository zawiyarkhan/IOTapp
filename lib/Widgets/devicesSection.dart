// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iot_app/Widgets/DeviceIcon.dart';

class DevicesList extends StatefulWidget {
  const DevicesList({super.key});

  @override
  State<DevicesList> createState() => _DevicesListState();
}

class _DevicesListState extends State<DevicesList> {
  List<String> names = [
    'Wifi',
    'Lights',
    'CCTV',
    'Media',
    'Thermostat',
    'TV',
  ];

  List<Icon> icons = [
    Icon(Icons.wifi),
    Icon(CupertinoIcons.sun_max),
    Icon(CupertinoIcons.video_camera),
    Icon(CupertinoIcons.speaker_1),
    Icon(Icons.thermostat),
    Icon(Icons.tv),
  ];

  List<Color> colors = [
    Color(0xffc4e2f5),
    Color(0xffb5f5e6),
    Color(0xfff2c2f0),
    Color(0xfff2f5c4),
    Color(0xfff5d0c4),
    Color(0xfff5d0c4),
  ];

  List<DevIcon> devIcons = [
    DevIcon(
      name: 'Wifi',
      icon: Icon(
        Icons.wifi,
        color: Colors.black,
      ),
      color: Color(0xffc4e2f5),
    ),
    DevIcon(
      name: 'Lights',
      icon: Icon(
        CupertinoIcons.sun_max,
        color: Colors.black,
      ),
      color: Color(0xffb5f5e6),
    ),
    DevIcon(
      name: 'CCTV',
      icon: Icon(
        CupertinoIcons.video_camera,
        color: Colors.black,
      ),
      color: Color(0xfff2c2f0),
    ),
    DevIcon(
      name: 'Media',
      icon: Icon(
        CupertinoIcons.speaker_1,
        color: Colors.black,
      ),
      color: Color(0xffc4e2f5),
    ),
    DevIcon(
      name: 'Thermostat',
      icon: Icon(
        Icons.thermostat,
        color: Colors.black,
      ),
      color: Color(0xfff2f5c4),
    ),
    DevIcon(
      name: 'TV',
      icon: Icon(
        Icons.tv,
        color: Colors.black,
      ),
      color: Color(0xfff5d0c4),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: devIcons.map((e) => e).toList()),
      ),
    );
  }
}
