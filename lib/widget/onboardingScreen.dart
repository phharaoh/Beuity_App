import 'OnboardingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              OnboardingPage(
                title: "Welcome to MyApp",
                description: "Discover new features.",
                imagePath: "image/start.jpeg",
              ),
              OnboardingPage(
                title: "Easy to Use",
                description: "Enjoy a user-friendly interface.",
                imagePath: "image/mid.jpeg",
              ),
              OnboardingPage(
                title: "Get Started",
                description: "Join us now.",
                imagePath: "image/last.jpeg",
              ),
            ],
          ),
          _buildIndicators(),
          if (_currentPage == 2) _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildIndicators() {
    return Positioned(
      bottom: 70.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 10.0,
            width: (index == _currentPage) ? 20.0 : 10.0,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: (index == _currentPage) ? Colors.blue : Colors.grey,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to the home screen or main part of your app
            Navigator.pushReplacementNamed(context, '/home');
          },
          child: Text('Start',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            // primary: Colors.blue,
            // onPrimary: Colors.white,
            minimumSize: Size(double.infinity, 50.0), // Full width button
          ),
        ),
      ),
    );
  }
}
