import 'package:flutter_riverpod/flutter_riverpod.dart';

final missileFireXProvider =
    StateNotifierProvider<MissileFireXController, double>(
  (ref) => MissileFireXController(),
);

class MissileFireXController extends StateNotifier<double> {
  MissileFireXController() : super(0);

/*missileFireX() => Timer.periodic(const Duration(milliseconds: 100), (timer) {
        state -= 0.1;
      });*/

/* static listenPlayerLimits(ref) {
    ref.listen(playerXProvider, (previous, next) {
      if (next < -1) {
        ref.read(playerXProvider.notifier).moveStopLeft();
      } else if (next > 1) {
        ref.read(playerXProvider.notifier).moveStopRight();
      }
    });
  }*/
}
