abstract class TimerEntity {
  Stream<Duration> get time;
  void start();
  void pause();
  void dispose();
}
