import 'package:flutter/material.dart';
import 'package:flutter_projects/landing_page.dart';
//import 'package:flutter_projects/signup_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (const Text(
          'FLUTTER',
          style: TextStyle(fontStyle: FontStyle.italic, color: Colors.teal),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LandingPage()));
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    backgroundColor: Colors.white.withOpacity(0.8)),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 16, color: Colors.teal),
                ))
          ],
        ),
      ),
    );
  }
}
