import 'package:sample/data/timer.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_service.g.dart';

class TimerService {
  TimerModel? _timerModel;

  TimerService();

  TimerModel getTimerModel(Duration initialDuration) {
    _timerModel ??= TimerModel(initialDuration);

    return _timerModel!;
  }

  void dispose() {
    _timerModel?.dispose();
  }
}

@riverpod
TimerService timerService(TimerServiceRef ref) {
  return TimerService();
}
