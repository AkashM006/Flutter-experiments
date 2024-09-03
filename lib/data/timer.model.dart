import 'dart:async';

import 'package:sample/domain/timer.entity.dart';

const intervalTime = Duration(milliseconds: 16);

class TimerModel extends TimerEntity {
  Timer? _timer;
  Duration _time;
  final Duration _init;
  DateTime _lastUpdated;
  bool _isRunning = false;

  final StreamController<Duration> _streamController =
      StreamController<Duration>.broadcast();

  TimerModel(Duration time)
      : _lastUpdated = DateTime.now(),
        _init = time,
        _time = time {
    Timer.run(
      () {
        _streamController.sink.add(_time);
      },
    );
  }

  @override
  Stream<Duration> get time => _streamController.stream;

  @override
  bool get isRunning => _isRunning;

  @override
  void start() {
    if (!_isRunning) _isRunning = true;
    _lastUpdated = DateTime.now();
    _timer = Timer.periodic(
      intervalTime,
      (timer) {
        final now = DateTime.now();

        _time += now.difference(_lastUpdated);
        _lastUpdated = now;
        _streamController.sink.add(_time);
      },
    );
  }

  @override
  void pause() {
    if (_isRunning) _isRunning = false;
    _timer?.cancel();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void reset() {
    pause();
    _streamController.sink.add(_init);
    _time = _init;
  }
}
