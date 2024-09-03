abstract class TimerEntity {
  Stream<Duration> get time;
  bool get isRunning;
  void start();
  void pause();
  void dispose();
  void reset();
}
