import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // Set the initial route to the splash page
      routes: {
        '/': (context) => SplashPage(),
      },
    );
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a delay for the splash screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the home page when the delay is over
      Navigator.of(context).pushReplacementNamed('/home');
    });

    return Scaffold(
      appBar: AppBar(title: Text('Splash Page')),
      body: Center(
        child: Text('Welcome to the Splash Page'),
      ),
    );
  }
}
