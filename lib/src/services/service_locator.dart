import 'package:get/get.dart';
import 'package:with_me/src/repositories/authentication_repository.dart';
import 'package:with_me/src/repositories/dashboard_repository.dart';
import 'package:with_me/src/services/get_storage_service.dart';
import 'package:with_me/src/services/startup_service.dart';

class ServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationRepository>(() => authRepository);
    Get.lazyPut<StartupService>(() => GetStorageService());
    Get.lazyPut<DashboardRepository>(() => dashboardRepository, fenix: true);
  }
}
