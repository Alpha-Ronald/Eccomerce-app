import 'package:flutter/material.dart';
import 'package:flutter_projects/productListing.dart';
import 'package:flutter_projects/signUp.dart';
//import 'package:flutter_projects/main.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.withOpacity(0.2),
          title: (const Text(
            'WELCOME BACK',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
          )),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Login',
                    style: TextStyle(
                        fontSize: 32,
                        fontStyle: FontStyle.italic,
                        color: Colors.tealAccent)),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal.withOpacity(0.5), width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal.withOpacity(0.5), width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      labelText: 'Email or Username',
                      prefixIcon: const Icon(Icons.mail)),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal.withOpacity(0.5), width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal.withOpacity(0.5), width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock)),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password ?',
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LandingPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        backgroundColor: Colors.tealAccent.withOpacity(0.5),
                        minimumSize: const Size(350, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: (BorderRadius.circular(15)))),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
