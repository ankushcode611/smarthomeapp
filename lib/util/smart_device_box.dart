// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import "dart:math";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerStatus;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerStatus,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerStatus ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsetsDirectional.symmetric(vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon
            Image.asset(iconPath,
                height: 65, color: powerStatus ? Colors.white : Colors.black),

            //connected smart devices name + switch

            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    smartDeviceName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: powerStatus ? Colors.white : Colors.black),
                  ),
                )),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                        value: powerStatus, onChanged: onChanged))
              ],
            )
          ],
        ),
      ),
    );
  }
}
