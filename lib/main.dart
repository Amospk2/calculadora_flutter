import 'package:flutter/material.dart';
import 'package:flutter_application_1/calculadora/buttons_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 61, 168, 255),
        title: const Text("Calculadora 1.0"),
      ),
      backgroundColor: Color.fromARGB(255, 52, 73, 94),
      body: ButtonPage(),
    );
  }
}
