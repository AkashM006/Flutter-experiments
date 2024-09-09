import 'package:sample/core/usecase.util.dart';
import 'package:sample/domain/timer.repository.dart';

class PersistTimerUsecase extends Usecase<void, void> {
  final TimerRepository _timerRepository;

  PersistTimerUsecase(this._timerRepository);

  @override
  void call({required void params}) {
    _timerRepository.persistTimer();
  }
}
