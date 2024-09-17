import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro1/Welcome_screen.dart';
import 'Category.dart';
import 'beuity.dart';


class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? Key}) : super(key: Key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool visible = false;
  TextEditingController passwordController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Register",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                fontWeight: FontWeight.bold,

              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: visible,
              decoration: InputDecoration(
                  labelText: "PassWord",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        visible = !visible;
                        setState(() {});
                      },
                      icon: visible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.redAccent,
              child: MaterialButton(
                onPressed: () {
                  // print(emailController.text);
                  // print(passwordController.text);
                  //
                  // await FirebaseAuth.instance
                  //     .createUserWithEmailAndPassword(
                  //         email: emailController.text,
                  //         password: passwordController.text)
                  //     .then((value) {
                  //   print(value.user!.uid);
                  // }).catchError((error) {
                  //   print(error.toString());
                  // });

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryList()),
                  );
                },
                child: Text("Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account!",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "login",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
