import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(flex: 1, child: TextFormField()),
              Expanded(flex: 1, child: TextFormField()),
              Expanded(flex: 1, child: TextFormField()),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  child: Text('Save'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
