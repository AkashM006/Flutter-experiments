abstract class TimerEntity {
  Stream<TimerEntity> get timer;
  bool get isRunning;
  Duration get time;

  TimerEntity(Duration time);

  void start();
  void pause();
  void dispose();
  void reset();
}
