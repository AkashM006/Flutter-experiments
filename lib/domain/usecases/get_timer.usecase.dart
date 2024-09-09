import 'package:sample/core/usecase.util.dart';
import 'package:sample/domain/timer.entity.dart';
import 'package:sample/domain/timer.repository.dart';

class GetTimerUsecase extends Usecase<TimerEntity, Duration> {
  final TimerRepository _timerRepository;

  GetTimerUsecase(this._timerRepository);

  @override
  TimerEntity call({required Duration params}) {
    return _timerRepository.getTimer(params);
  }
}
