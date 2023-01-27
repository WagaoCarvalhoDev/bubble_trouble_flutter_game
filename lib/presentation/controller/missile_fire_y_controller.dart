import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final missileFireYProvider =
    StateNotifierProvider<MissileFireYController, double>(
  (ref) => MissileFireYController(),
);

class MissileFireYController extends StateNotifier<double> {
  MissileFireYController() : super(10);

  missileFire() => Timer.periodic(const Duration(milliseconds: 1), (timer) {
        state += 10;
      });
}
