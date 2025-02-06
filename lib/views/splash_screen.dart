import 'package:flutter/material.dart';
import 'package:quickensol_task/views/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void navigateToLogin(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    
    navigateToLogin(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Transform.scale(
          scale: 0.8,
          child: Image.asset('assets/images/company_logo.png'),
        ),
      ),
    );
  }
}
