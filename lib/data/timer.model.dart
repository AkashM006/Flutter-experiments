import 'dart:async';

import 'package:sample/domain/timer.entity.dart';

const intervalTime = Duration(milliseconds: 16);

class TimerModel extends TimerEntity {
  Timer? _timer;
  Duration _time;
  final Duration _init;
  DateTime _lastUpdated;
  bool _isRunning = false;

  final StreamController<TimerModel> _streamController =
      StreamController<TimerModel>.broadcast();

  TimerModel(Duration time)
      : _lastUpdated = DateTime.now(),
        _init = time,
        _time = time {
    Timer.run(
      () {
        _streamController.sink.add(this);
      },
    );
  }

  @override
  bool get isRunning => _isRunning;

  @override
  Duration get time => _time;

  @override
  Stream<TimerEntity> get timer => _streamController.stream;

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
        _streamController.sink.add(this);
      },
    );
  }

  @override
  void pause() {
    if (_isRunning) _isRunning = false;
    _timer?.cancel();
    _streamController.sink.add(this);
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void reset() {
    pause();
    _time = _init;
    _streamController.sink.add(this);
  }
}
