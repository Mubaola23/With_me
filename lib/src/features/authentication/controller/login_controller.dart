import 'package:get/get.dart';
import 'package:with_me/src/core/routes.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';
import 'package:with_me/src/repositories/authentication_repository.dart';

import '../../../core/constants/failure.dart';

class LoginController extends BaseChangeNotifier {
  final authRepo = Get.find<AuthenticationRepository>();
  bool _visibility = true;
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

  Future<void> login(
      {required String emailAddress, required String password}) async {
    try {
      setState(state: AppState.loading);

      await authRepo.login(emailAddress: emailAddress, password: password);
      Get.offAllNamed(Routes.home);
    } on Failure catch (ex) {
      Get.back();
      Get.snackbar(
        'Error',
        ex.message,
        colorText: Get.theme.colorScheme.onError,
        backgroundColor: Get.theme.errorColor,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(state: AppState.idle);
    }
  }
}
