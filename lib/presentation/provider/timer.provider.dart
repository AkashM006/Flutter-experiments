import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/data/timer_repository.impl.dart';
import 'package:sample/domain/usecases/get_timer.usecase.dart';
import 'package:sample/domain/timer.entity.dart';
import 'package:sample/domain/usecases/persist_timer.usecase.dart';

part 'timer.provider.g.dart';

// @riverpod
// TimerEntity timer(TimerRef ref, Duration time) {
//   final timerRepository = ref.watch(timerRepositoryProvider);

//   return GetTimerUsecase(timerRepository)(params: time);
// }
@riverpod
class Timer extends _$Timer {
  @override
  TimerEntity build(Duration time) {
    final timerRepository = ref.watch(timerRepositoryProvider);

    return GetTimerUsecase(timerRepository)(params: time);
  }

  void persist() {
    print("persist");
    final timerRepository = ref.watch(timerRepositoryProvider);

    PersistTimerUsecase(timerRepository)(params: null);
  }
}
