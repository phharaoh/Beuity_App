import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFairbaeScreen extends StatefulWidget {
  const CloudFairbaeScreen({super.key});

  @override
  State<CloudFairbaeScreen> createState() => _CloudFairbaeScreenState();
}

class _CloudFairbaeScreenState extends State<CloudFairbaeScreen> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: idcontroller,
              decoration: const InputDecoration(labelText: "ID"),
            ),
            TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            IconButton(onPressed: () async{
              final docuser =
                  FirebaseFirestore.instance.collection("name").doc("employee2");
              final employeesmap ={
                "id":int.parse(idcontroller.text),
                "name":namecontroller.text,
              };

              await docuser.set(employeesmap);

            }, icon: const Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}
