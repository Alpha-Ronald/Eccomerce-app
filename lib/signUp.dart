import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:flutter_projects/signIn_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal.withOpacity(0.2),
        title: (const Text(
          'Lets get you started ',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.white,
            //fontWeight: FontWeight.bold
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
            child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 32,
                  fontStyle: FontStyle.italic,
                  color: Colors.tealAccent),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'Username'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.mail)),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(CupertinoIcons.padlock)),
            ),
            /*const SizedBox(
              height: 15,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(CupertinoIcons.padlock_solid)),
            ),*/
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: _signUp,
              /*() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpSuccessful()));
              },*/
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  backgroundColor: Colors.tealAccent.withOpacity(0.5),
                  minimumSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: (BorderRadius.circular(15)))),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }

  void _signUp() async {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('User is Succesfully created');
      Navigator.pushNamed(context, '/home');
    } else {
      print('Some error occured');
    }
  }
}

class SignUpSuccessful extends StatelessWidget {
  const SignUpSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.teal.withOpacity(0.2),
          title: const Text(
            'Rex Shoe collection',
            style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
          ),
        ),*/
        body: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Account \nSuccessfully \ncreated.',
                  style: TextStyle(color: Colors.tealAccent, fontSize: 35),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16),
                      backgroundColor: Colors.tealAccent.withOpacity(0.2),
                      minimumSize: const Size(350, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: (BorderRadius.circular(15)))),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            )));
  }
}
