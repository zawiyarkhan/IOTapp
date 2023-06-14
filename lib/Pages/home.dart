// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:iot_app/Widgets/WeatherCard.dart';
import 'package:iot_app/Widgets/custom_slider.dart';
import 'package:iot_app/Widgets/devicesSection.dart';
import 'package:iot_app/Widgets/room_card.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String value = 'Bedroom';
  bool status = true;
  final rooms = ['Bedroom', 'Living Room', 'Lounge', 'Washroom', 'Kitchen'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Home",
                    style: GoogleFonts.notoSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(
                    CupertinoIcons.add_circled,
                    size: 35,
                  ),
                ],
              ),
              SizedBox(height: 30),
              WeatherCard(),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Devices",
                      style: GoogleFonts.notoSans(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "See All",
                      style: GoogleFonts.notoSans(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              DevicesList(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rooms",
                      style: GoogleFonts.notoSans(
                          fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: value,
                            items: rooms.map(menuItem).toList(),
                            onChanged: (value) => setState(() {
                                  this.value = value!;
                                })),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RoomCard(
                      name: "Lights",
                      showIcon: Icon(
                        CupertinoIcons.sun_max,
                        size: 35,
                      ),
                      interact: FlutterSwitch(
                          value: status,
                          width: 60,
                          height: 30,
                          borderRadius: 30.0,
                          //toggleSize: 50.0,
                          onToggle: (value) => {
                                setState(
                                  () {
                                    this.status = value;
                                  },
                                )
                              }),
                      room: value,
                    ),
                    RoomCard(
                      name: "Speakers",
                      interact: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.play_circle_fill,
                            size: 40,
                          )),
                      showIcon: Icon(
                        CupertinoIcons.headphones,
                        size: 35,
                      ),
                      room: value,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.shade200,
                  spreadRadius: 0,
                  blurRadius: 20,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(
                CupertinoIcons.mic,
                size: 29,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> menuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: GoogleFonts.notoSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
