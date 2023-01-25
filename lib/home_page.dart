import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/widgets/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Padding constants
  final double hpad = 40.0;
  final double vpad = 25.0;
  // List of smart devices in the app
  List smartDevices = [
    //['Appliance name','imagepath',on/off status]

    ['Smart Light', 'icons/light-bulb.png', true],
    ['Smart Fan', 'icons/fan.png', false],
    ['Smart AC', 'icons/air-conditioner.png', false],
    ['Smart TV', 'icons/smart-tv.png', false]
  ];

  onOffStatusChanged(bool value, int index) {
    setState(() {
      smartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Customized App Bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'icons/menu.png',
                      height: 45,
                      color: Colors.grey.shade800,
                    ),
                    Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.grey.shade800,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome home,',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade700),
                    ),
                    Text('Username', style: GoogleFonts.bebasNeue(fontSize: 72))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: hpad),
              //   child: Divider(
              //     thickness: 1,
              //     color: Colors.grey.shade800,
              //   ),
              // ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
                  child: Text('Smart Devices',
                      style: TextStyle(
                          fontSize: 24, color: Colors.grey.shade700))),
                Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(25),
                      itemCount: smartDevices.length,
                      gridDelegate:
                          (const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1 / 1.3)),
                      itemBuilder: (context, index) {
                        return SmartDeviceBox(
                          smartDeviceName: smartDevices[index][0],
                          iconPath: smartDevices[index][1],
                          onOffStatus: smartDevices[index][2],
                          onChanged: (value) =>
                              onOffStatusChanged(value, index),
                        );
                      }))
            ]),
      ),
    );
  }
}
