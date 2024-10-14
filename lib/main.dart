import 'package:flutter/material.dart';
import 'package:patrol_error/workmanager.dart';
import 'package:workmanager/workmanager.dart';

void main() {
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    Workmanager().registerOneOffTask(
      'contactsInitial${DateTime.now().millisecondsSinceEpoch}',
      'sample_task',
      initialDelay: const Duration(seconds: 5),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
      inputData: {'url': 'dummyUrl', 'env': 'dev'},
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
