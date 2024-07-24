import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Smartdevices extends StatelessWidget {
  final String name;
  final String iconpath;
  final bool poweronOff;
  void Function(bool)? onChanged;
  Smartdevices(
      {super.key,
      required this.name,
      required this.iconpath,
      required this.poweronOff,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: poweronOff ? Colors.grey[900] : Colors.grey[100]),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              iconpath,
              height: 40,
              color: poweronOff ? Colors.white : Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                          color: poweronOff ? Colors.white : Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                          thumbColor: Colors.grey[400],
                          activeColor: Colors.grey[600],
                          trackColor: Colors.white,
                          value: poweronOff,
                          onChanged: onChanged))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
