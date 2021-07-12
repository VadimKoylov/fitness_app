import 'package:fitness_app/sign_up/sign_up.dart';
import 'package:flutter/material.dart';

// main() является главной функцией с которой начинается
// выполнение приложения
// возвращает виджет приложения
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUp(),
    );
  }
}