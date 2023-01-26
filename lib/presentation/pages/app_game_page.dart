import 'package:bubble_trouble_flutter_game/presentation/widgets/burron_game_widget.dart';
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
              child: Center(
                child: Stack(children: [
                  Container(
                    alignment: const Alignment(0, 1),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.blue,
                        height: 50,
                        width: 50,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  ButtonGameWidget(icon: Icon(Icons.play_arrow)),
                  ButtonGameWidget(icon: Icon(Icons.arrow_back)),
                  ButtonGameWidget(icon: Icon(Icons.arrow_upward)),
                  ButtonGameWidget(icon: Icon(Icons.arrow_forward)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
