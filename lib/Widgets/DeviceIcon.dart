// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class DevIcon extends StatefulWidget {
  String name;
  Icon icon;
  Color color;
  DevIcon(
      {super.key, required this.name, required this.icon, required this.color});

  @override
  State<DevIcon> createState() => _DevIconState();
}

class _DevIconState extends State<DevIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          CircleAvatar(
              radius: 35, backgroundColor: widget.color, child: widget.icon),
          SizedBox(
            height: 10,
          ),
          Text(widget.name,
              style: GoogleFonts.notoSans(
                fontSize: 15,
              ))
        ],
      ),
    );
  }
}
