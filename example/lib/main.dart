import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_logcat/flutter_logcat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                  onPressed: () => Log.d("DEBUG_TAG", "Debug Message"),
                  child: const Text("Log Debug")),
              TextButton(
                  onPressed: () => Log.i("INFO_TAG", "Info Message"),
                  child: const Text("Log Info"))
            ],
          ),
        ),
      ),
    );
  }
}
