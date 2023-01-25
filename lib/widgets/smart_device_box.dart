import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool onOffStatus;
  void Function(bool)? onChanged;

 SmartDeviceBox({super.key,
      required this.smartDeviceName,
      required this.iconPath,
      required this.onOffStatus,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: onOffStatus?Colors.grey.shade900:Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: onOffStatus?Colors.white:Colors.black,
              ),
              Row(
                children: [
                  Expanded(child: Text(smartDeviceName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: onOffStatus?Colors.white:Colors.black),)),
                  Switch(value: onOffStatus, onChanged: onChanged)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
