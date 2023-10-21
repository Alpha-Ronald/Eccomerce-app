import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/signIn_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
            const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_circle),
                  labelText: 'Username'),
            ),
            /*const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Gender'),
            ),*/
            const SizedBox(
              height: 15,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.mail)),
            ),
            const SizedBox(
              height: 15,
            ),
            /*const TextField(
              decoration: InputDecoration(labelText: 'Phone number'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Address'),
            ),
            const SizedBox(
              height: 10,
            ),*/
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'New Password',
                  prefixIcon: Icon(CupertinoIcons.padlock)),
            ),
            const SizedBox(
              height: 15,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(CupertinoIcons.padlock_solid)),
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpSuccessful()));
              },
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

/*
ElevatedButton(
onPressed: () {
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => const SignInPage()));
},*/
