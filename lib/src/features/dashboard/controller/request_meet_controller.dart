import 'package:intl/intl.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';

import '../model/time_item.dart';

class RequestMeetController extends BaseChangeNotifier {
  int _currentStep = 0;

  int get currentStep => _currentStep;

  tapped(int step) {
    _currentStep = step;
    setState();
  }

  continued() {
    _currentStep < 2 ? _currentStep += 1 : null;
    setState();
  }

  cancel() {
    _currentStep > 0 ? _currentStep -= 1 : null;
    setState();
  }

  String text = "Select Date";
  DateTime? pickedDates = DateTime.now();
  // DateTime? pilltime = DateTime(DateTime.now().year - 100);
  Future<Null> selectStartTime(DateTime? time, DateTime? pickedDate) async {
    if (time != null) {
      pickedDate = time;
      text = DateFormat("MMMM y").format(pickedDate);
      pickedDates = time;
      setState();
    }
  }

  String? timeText;
  final List<TimeItem> _timeItems = [
    TimeItem(title: "pickedDates.day.toString() ", subtitle: "5766"),
    TimeItem(title: 'sat', subtitle: "5766"),
    TimeItem(title: 'mar', subtitle: "5766"),
    TimeItem(title: 'feb', subtitle: "5766"),
    TimeItem(title: 'red', subtitle: "5766"),
    TimeItem(title: 'mar', subtitle: "5766"),
  ];
  // Getters
  int _selected = 0;

  int get selected => _selected;
  List<TimeItem> get timeItems => _timeItems;

  void onChanged(int val) {
    _selected = val;
    setState();
  }
}
