import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_projects/blocObserverdemo.dart';
import 'package:flutter_projects/blocState.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          theme: ThemeData.dark(),
        ));
  }
}
