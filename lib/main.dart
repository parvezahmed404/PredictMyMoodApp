import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('My Mood'),
          backgroundColor: Colors.black26,
        ),
        body: MyMoodPage(),
      ),
    );
  }
}

class MyMoodPage extends StatefulWidget {
  const MyMoodPage({super.key});

  @override
  State<MyMoodPage> createState() => _MyMoodPageState();
}

class _MyMoodPageState extends State<MyMoodPage> {
  late String moodName;
  @override
  void initState() {
    changeMyMoode();
    super.initState();
  }

  void changeMyMoode() {
    setState(() {
      moodName = (Random().nextInt(5) + 1).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: Image.asset(
              "images/$moodName.png",
              key: ValueKey<String>(moodName),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => changeMyMoode(),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            textStyle: const TextStyle(fontSize: 16),
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text("Predict My Mood"),
        ),
      ],
    );
  }
}
