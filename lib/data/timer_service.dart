import 'dart:convert';

import 'package:sample/core/sp.util.dart';
import 'package:sample/data/timer.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'timer_service.g.dart';

class TimerService {
  TimerModel? _timerModel;
  final SharedPreferences _sp;

  TimerService(this._sp);

  TimerModel getTimerModel(Duration initialDuration) {
    if (_timerModel != null) return _timerModel!;

    try {
      final result = _sp.getString(TimerModel.key);

      if (result != null) {
        _timerModel = TimerModel.fromJson(jsonDecode(result));
      } else {
        _timerModel = TimerModel(initialDuration);
      }
    } catch (e) {
      print("Error: $e");
      _timerModel = TimerModel(initialDuration);
    }

    return _timerModel!;
  }

  void persistTimer() {
    if (_timerModel == null) return;

    if (_timerModel!.time == Duration.zero) return;

    try {
      _sp.setString(TimerModel.key, jsonEncode(_timerModel));
    } catch (e) {
      print("Error: $e");
      return;
    }
  }

  void dispose() {
    _timerModel?.dispose();
  }
}

@riverpod
TimerService timerService(TimerServiceRef ref) {
  final sp = ref.watch(spProvider);

  return TimerService(sp);
}
