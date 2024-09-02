import 'dart:async';

const intervalTime = Duration(milliseconds: 16);

class TimerModel {
  Timer? _timer;
  Duration _time;
  final Duration _init;
  DateTime _lastUpdated;

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

  Stream<Duration> get time => _streamController.stream;

  void start() {
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

  void pause() {
    _timer?.cancel();
  }

  void dispose() {
    _streamController.close();
  }

  void reset() {
    pause();
    _streamController.sink.add(_init);
    _time = _init;
  }
}
