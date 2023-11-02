import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/signUp.dart';

import 'package:flutter_projects/blocObserverdemo.dart';
import 'package:flutter_projects/blocState.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SignUpPage(),
          theme: ThemeData.dark(),
        ));
  }
}
