import 'package:flutter/material.dart';
import 'package:gigshub/components/items.dart';
import 'package:gigshub/constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        title: Center(
          child: Text(widget.title ?? "Shopping List"),
        ),
      ),
      body: Items(),
    );
  }
}
