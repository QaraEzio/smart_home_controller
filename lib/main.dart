import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_home_control/profile.dart';
import 'package:smart_home_control/smartdevices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List smartdevices = [
    ['Smart TV', 'lib/icons/tv.png', true],
    ['Smart Light', 'lib/icons/idea.png', false],
    ['Smart AC', 'lib/icons/home.png', false],
    ['Smart Fan', 'lib/icons/ceiling-fan.png', false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartdevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new ProfileView()));
                    },
                  )
                ],
              ),
            ),

            // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Qara Ezio',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Text(
                'Smart Devices',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            Expanded(
                child: GridView.builder(
              padding: EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
              itemCount: smartdevices.length,
              itemBuilder: (context, index) {
                return Smartdevices(
                  iconpath: smartdevices[index][1],
                  name: smartdevices[index][0],
                  poweronOff: smartdevices[index][2],
                  onChanged: (value) => powerSwitchChanged(value, index),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
