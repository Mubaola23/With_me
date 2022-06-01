import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/constants/app_user.dart';

class FireStoreService {
  final userCollection = FirebaseFirestore.instance.collection('users');

  Future<AppUser?> getUserWithId(String userId) async {
    final snapshot = await userCollection.doc(userId).get();
    return snapshot.exists ? AppUser.fromDocumentSnapshot(snapshot) : null;
  }

  Future<void> createUserWithId(
    String userId, {
    required String emailAddress,
    required String firstName,
    required String lastName,
    required String location,
    required String photoUrl,
    required String phoneNumber,
  }) async {
    return await userCollection.doc(userId).set({
      'emailAddress': emailAddress,
      'firstName': firstName,
      'lastName': lastName,
      'location': location,
      'photoUrl': photoUrl,
      'phoneNumber': phoneNumber,
      'createdAt': Timestamp.now(),
    });
  }

  Future<dynamic> updatePhone(String phoneNumber) async {
    User? user = FirebaseAuth.instance.currentUser;

    return await userCollection.doc(user?.uid).collection('users').add({
      'phoneNumber': phoneNumber,
    });
  }

  Future<dynamic> updateLocation(String location) async {
    User? user = FirebaseAuth.instance.currentUser;

    return await userCollection.doc(user?.uid).update({
      'location': location,
    });
  }
}
