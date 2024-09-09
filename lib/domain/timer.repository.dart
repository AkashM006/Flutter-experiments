import 'package:sample/domain/timer.entity.dart';

abstract class TimerRepository {
  TimerEntity getTimer(Duration initialDuration);
  void persistTimer();
}
