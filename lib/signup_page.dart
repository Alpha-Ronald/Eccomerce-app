import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:flutter_projects/landing_page.dart';
import 'package:flutter_projects/SignIn_page.dart';
import 'package:flutter_projects/blocObserverdemo.dart';
import 'package:flutter_projects/blocstate.dart';
import 'package:flutter_projects/splashscreen.dart';

/*void main() {
  runApp(
      BlocProvider(create: (context) => CartBloc(), child: const FirstApp()));
}*/

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.dark(),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'SignUp',
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              textAlign: TextAlign.left,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Full name (Last name, First Name, Middle Name)'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
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
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'New Password'),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            const SizedBox(height: 20),
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
                  backgroundColor: Colors.white),
              child: const Text(
                "Sign Up",
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        foregroundColor: Colors.red),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignUpSuccessful extends StatelessWidget {
  const SignUpSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal.withOpacity(0.2),
          title: const Text(
            'Rex Shoe collection',
            style: TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Account Successfully created.'),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.teal),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 12),
                    ))
              ],
            )));
  }
}

/*class AppBar2 extends StatelessWidget implements PreferredSizeWidget {
  const AppBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.teal.withOpacity(0.2),
      title: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: const TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  prefixIconColor: Colors.teal,
                  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  hintText: 'Search shoe',
                  prefixIcon: Icon(Icons.search)),
            ),
          )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag_sharp),
            iconSize: 30,
          ),
        ],
      ),
      // actions: <Widget>[ShoppingCartBadge()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

 */
