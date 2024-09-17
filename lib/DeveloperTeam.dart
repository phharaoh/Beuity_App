import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'beuity.dart';

class DevTeam extends StatefulWidget {
  const DevTeam({super.key});

  @override
  State<DevTeam> createState() => _DevTeamState();
}

class _DevTeamState extends State<DevTeam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'DevelperTeam',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 50,
            ),
            Text(
              'Ahmed Hegazy Farouk',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
