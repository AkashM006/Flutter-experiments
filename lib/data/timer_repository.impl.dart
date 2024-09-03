import 'package:sample/data/timer.model.dart';
import 'package:sample/data/timer_service.dart';
import 'package:sample/domain/timer.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer_repository.impl.g.dart';

class TimerRepositoryImpl extends TimerRepository {
  final TimerService _timerService;

  TimerRepositoryImpl(this._timerService);

  @override
  TimerModel getTimer(Duration initialDuration) {
    return _timerService.getTimerModel(initialDuration);
  }
}

@riverpod
TimerRepository timerRepository(TimerRepositoryRef ref) {
  final timerService = ref.watch(timerServiceProvider);

  ref.onDispose(() {
    timerService.dispose();
  });

  return TimerRepositoryImpl(timerService);
}
