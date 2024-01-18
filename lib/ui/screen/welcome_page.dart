import 'package:flutter/material.dart';
import 'package:todo_apps/ui/screen/login_page.dart';
import 'package:todo_apps/ui/screen/register_page.dart';
import 'package:todo_apps/ui/screen/onboarding.dart'; // Sesuaikan dengan path yang benar

class SimpleWelcomePage extends StatelessWidget {
  const SimpleWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/clipboard.png', // Sesuaikan dengan path gambar Anda
                fit: BoxFit.cover,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.04), // Sesuaikan dengan ukuran yang diinginkan
              Text(
                'Hello!',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(letterSpacing: 3),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Sesuaikan dengan ukuran yang diinginkan
              Text(
                'Welcome to the best Task manager baby!',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      letterSpacing: 3,
                      fontSize: MediaQuery.of(context).size.width *
                          0.032, // Sesuaikan dengan ukuran yang diinginkan
                      wordSpacing: 2,
                    ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.04), // Sesuaikan dengan ukuran yang diinginkan
              _myButton(context, 'Login', LoginPage()),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Sesuaikan dengan ukuran yang diinginkan
              _myButton(context, 'Sign Up', RegisterPage()),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.02), // Sesuaikan dengan ukuran yang diinginkan
              _myOutlinedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myButton(BuildContext context, String title, Widget destination) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          0.8, // Sesuaikan dengan ukuran yang diinginkan
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.deepPurple,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
        child: Text(
          title,
          style: TextStyle(
              fontSize: MediaQuery.of(context).size.width *
                  0.04), // Sesuaikan dengan ukuran yang diinginkan
        ),
      ),
    );
  }

  Widget _myOutlinedButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.8, // Sesuaikan dengan ukuran yang diinginkan
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SimpleOnboardingPage()),
          );
        },
        child: Text(
          'Register Later',
          style: Theme.of(context).textTheme.headline1?.copyWith(
                fontSize: MediaQuery.of(context).size.width *
                    0.032, // Sesuaikan dengan ukuran yang diinginkan
                color: Colors.deepPurple,
              ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SimpleWelcomePage(),
  ));
}
