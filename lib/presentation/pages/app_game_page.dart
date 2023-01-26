import 'package:bubble_trouble_flutter_game/presentation/controller/player_move_controller.dart';
import 'package:bubble_trouble_flutter_game/presentation/widgets/button_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/player_widget.dart';

class AppGamePage extends ConsumerStatefulWidget {
  const AppGamePage({super.key});

  @override
  AppGamePageState createState() => AppGamePageState();
}

class AppGamePageState extends ConsumerState<AppGamePage> {
  @override
  Widget build(BuildContext context) {
    final playerX = ref.watch(playerXProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('widget.title'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (value) {
          if (value.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            ref.read(playerXProvider.notifier).moveLeft();
          } else if (value.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            ref.read(playerXProvider.notifier).moveRight();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.pink[100],
                child: Center(
                  child: Stack(children: [
                    PlayerWidget(playerX: playerX),
                  ]),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.purple[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonGameWidget(icon: Icon(Icons.play_arrow)),
                    ButtonGameWidget(
                      icon: Icon(Icons.arrow_back),
                      onTap: () =>
                          ref.read(playerXProvider.notifier).moveLeft(),
                    ),
                    ButtonGameWidget(icon: Icon(Icons.arrow_upward)),
                    ButtonGameWidget(
                      icon: Icon(Icons.arrow_forward),
                      onTap: () =>
                          ref.read(playerXProvider.notifier).moveRight(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
