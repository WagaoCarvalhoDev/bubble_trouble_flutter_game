import 'package:flutter/material.dart';

class AppGamePage extends StatefulWidget {
  const AppGamePage({super.key, required this.title});

  final String title;

  @override
  State<AppGamePage> createState() => _AppGamePageState();
}

class _AppGamePageState extends State<AppGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.pink[100],
              )),
          Expanded(
              child: Container(
            color: Colors.grey,
          )),
        ],
      ),
    );
  }
}
