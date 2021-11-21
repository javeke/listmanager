import 'package:flutter/material.dart';
import 'package:gigshub/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:gigshub/providers/list_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ListProvider()),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  final title = "Shopping List";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: title),
    );
  }
}
