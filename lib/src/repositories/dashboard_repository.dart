import 'package:firebase_auth/firebase_auth.dart';

import '../core/constants/failure.dart';
import '../services/database/firestore_service.dart';

class DashboardRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  FireStoreService fireStoreService = FireStoreService();

  Future<dynamic> updateLocation(String location) async {
    try {
      await fireStoreService.updateLocation(location);
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }
}

final dashboardRepository = DashboardRepository();
