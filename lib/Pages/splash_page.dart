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
        '/home': (context) => HomePage(),
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Page'),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the splash page
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text('Go Back to Splash Page'),
            ),
          ],
        ),
      ),
    );
  }
}
