// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:iot_app/Widgets/custom_slider.dart';

class RoomCard extends StatefulWidget {
  String name;
  Icon showIcon;
  Widget interact;
  RoomCard(
      {super.key,
      required this.name,
      required this.interact,
      required this.showIcon});

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        print("tapped");
      },
      onLongPress: () {
        openDialog();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        height: 120,
        width: width / 2.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Color(0xffdcf6fc)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [widget.showIcon, widget.interact],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              widget.name,
              style: GoogleFonts.notoSans(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => Center(
          child: Container(
              height: 400,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: SliderTheme(
                data: SliderThemeData(
                  trackHeight: 100,
                  thumbShape: SliderComponentShape.noThumb,
                  overlayShape: SliderComponentShape.noOverlay,
                  valueIndicatorShape: SliderComponentShape.noOverlay,
                  //trackShape: RectangularSliderTrackShape(),
                  trackShape: RoundedRectSliderTrackShape(),
                ),
                child: Container(
                  height: 380,
                  child: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            RotatedBox(
                              quarterTurns: 3,
                              child: Slider(
                                value: value,
                                min: 0,
                                max: 100,
                                divisions: 100,
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                            Center(
                              child: Text(
                                "",
                                //"${value.round()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      );
}
