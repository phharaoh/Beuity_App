import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'beuity.dart';

class aboutApp extends StatefulWidget {
  const aboutApp({super.key});

  @override
  State<aboutApp> createState() => _aboutAppState();
}

class _aboutAppState extends State<aboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Glamour Shop!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.0),

              // Description of the app
              Text(
                'Glamour Shop is your one-stop destination for all things makeup. '
                'We offer a wide range of high-quality makeup products including foundations, '
                'lipsticks, eyeshadows, and more. Whether you are a beauty enthusiast or a professional makeup artist, '
                'we have something for everyone. Enjoy browsing through our collection of premium beauty products, '
                'find the best deals, and get ready to glam up your look!',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),

              // Button to navigate to the product shop
              MaterialButton(
                onPressed: ()  {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductsApi(beauty: '',)),
                  );
                },
                child: Text(
                  'Shop Now',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
