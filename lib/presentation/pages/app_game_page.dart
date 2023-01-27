import 'package:bubble_trouble_flutter_game/presentation/controller/player_move_controller.dart';
import 'package:bubble_trouble_flutter_game/presentation/widgets/button_game_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/missile_fire_y_controller.dart';
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
    final missileX = playerX;
    double missileY = 1;
    double missileHeight = ref.watch(missileFireYProvider);

    PlayerMoveController.listenPlayerLimits(ref);
    //MissileFireXController.missileFireXPosition(ref, missileX);

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
          if (value.isKeyPressed(LogicalKeyboardKey.space)) {
            //ref.read(playerXProvider.notifier).fireMissile();
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
                    Container(
                      alignment: Alignment(missileX, missileY),
                      child: Container(
                        height: missileHeight,
                        width: 5,
                        color: Colors.red,
                      ),
                    ),
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
                    const ButtonGameWidget(icon: Icon(Icons.play_arrow)),
                    ButtonGameWidget(
                        icon: const Icon(Icons.arrow_back),
                        onTap: () {
                          ref.read(playerXProvider.notifier).moveLeft();
                        }),
                    ButtonGameWidget(
                        icon: Icon(Icons.arrow_upward),
                        onTap: () {
                          ref
                              .read(missileFireYProvider.notifier)
                              .missileFire(context);
                        }),
                    ButtonGameWidget(
                      icon: const Icon(Icons.arrow_forward),
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
