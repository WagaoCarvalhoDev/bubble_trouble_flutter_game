import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'player_move_controller.dart';

final missileFireXProvider =
    StateNotifierProvider<MissileFireXController, double>(
  (ref) => MissileFireXController(),
);

class MissileFireXController extends StateNotifier<double> {
  MissileFireXController() : super(0);

  missileFireX(pos) => state = pos;

  static missileFireXPosition(ref, pos) {
    ref.listen(playerXProvider, (previous, next) {
      ref.read(missileFireXProvider.notifier).missileFireX(pos);
    });
  }
}
