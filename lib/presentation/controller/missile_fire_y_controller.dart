import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final missileFireYProvider =
    StateNotifierProvider<MissileFireYController, double>(
  (ref) => MissileFireYController(),
);

class MissileFireYController extends StateNotifier<double> {
  MissileFireYController() : super(10);

  missileFire(context) =>
      Timer.periodic(const Duration(milliseconds: 1), (timer) {
        if (state > MediaQuery.of(context).size.height * 3 / 4) {
          timer.cancel();
        } else {
          state += 10;
        }
      });
}
