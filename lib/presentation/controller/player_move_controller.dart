import 'package:flutter_riverpod/flutter_riverpod.dart';

final playerXProvider = StateNotifierProvider<PlayerMoveController, double>(
  (ref) => PlayerMoveController(),
);

class PlayerMoveController extends StateNotifier<double> {
  PlayerMoveController() : super(0);

  moveLeft() => state -= 0.1;

  moveRight() => state += 0.1;

  moveStopLeft() => state = -1;

  moveStopRight() => state = 1;
}
