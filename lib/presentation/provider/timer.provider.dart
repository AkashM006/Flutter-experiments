import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sample/data/timer_repository.impl.dart';
import 'package:sample/domain/get_timer.usecase.dart';
import 'package:sample/domain/timer.entity.dart';

part 'timer.provider.g.dart';

@riverpod
TimerEntity timer(TimerRef ref, Duration time) {
  final timerRepository = ref.watch(timerRepositoryProvider);

  return GetTimerUsecase(timerRepository)(params: time);
}
