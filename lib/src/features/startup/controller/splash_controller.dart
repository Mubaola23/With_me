import 'package:get/get.dart';
import 'package:with_me/src/features/authentication/views/login_screen.dart';
import 'package:with_me/src/repositories/authentication_repository.dart';

import '../../../core/constants/app_user.dart';
import '../../../core/routes.dart';
import '../../../core/utilities/base_change_notifier.dart';
import '../../../services/startup_service.dart';
import '../view/onboarding_screen.dart';

class SplashController extends BaseChangeNotifier {
  @override
  void onInit() {
    decideNavigation();
    super.onInit();
  }

  void decideNavigation() async {
    bool viewed = await Get.find<StartupService>().readOnboardingViewed();
    AppUser? user =
        await Get.find<AuthenticationRepository>().getAuthenticatedUser();
    // await Future.delayed(const Duration(seconds: 3));

    print(viewed);
    if (viewed == true) {
      if (user != null) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.off(() => const LoginScreen());
      }
    } else {
      Get.off(() => OnboardingScreen());
    }
  }
}
