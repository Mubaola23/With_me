import 'package:with_me/src/core/utilities/base_change_notifier.dart';

class SignUpController extends BaseChangeNotifier {
  bool _visibility = false;
  bool _checkBox = false;
  bool get visibility => _visibility;

  bool get checkBox => _checkBox;

  onChange() {
    _visibility = !_visibility;
    setState();
  }

  onChangeBox() {
    _checkBox = !_checkBox;
    setState();
  }
}
