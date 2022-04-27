import 'package:get/get.dart';
import 'package:with_me/src/core/utilities/base_change_notifier.dart';

class SplashController extends BaseChangeNotifier {
  @override
  void onInit() async {
    // TODO: implement onInit
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed("/onboarding");

    super.onInit();
  }
}
