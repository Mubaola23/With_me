import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:with_me/src/core/constants/app_user.dart';
import 'package:with_me/src/core/constants/failure.dart';
import 'package:with_me/src/services/database/firestore_service.dart';

import '../core/constants/user_params.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required this.firebaseAuth,
    required this.firebaseFunctions,
    required this.googleSignIn,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseFunctions firebaseFunctions;
  final GoogleSignIn googleSignIn;
  FireStoreService fireStoreService = FireStoreService();

  User? get currentUser => firebaseAuth.currentUser;

  Future<AppUser?> getAuthenticatedUser() async {
    User? user = firebaseAuth.currentUser;

    return user != null ? await fireStoreService.getUserWithId(user.uid) : null;
  }

  Future<dynamic> register({required UserParams params}) async {
    try {
      final UserCredential _userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: params.emailAddress,
        password: params.password,
      );

      try {
        await _userCredential.user?.sendEmailVerification();
        List<String> name = params.fullName.split(" ");
        await fireStoreService.createUserWithId(
          _userCredential.user!.uid,
          emailAddress: params.emailAddress,
          firstName: name.first,
          lastName: name.last,
          location: params.location,
          phoneNumber: '',
          photoUrl: '',
        );

        return await fireStoreService.getUserWithId(_userCredential.user!.uid);
      } catch (ex) {
        await _userCredential.user!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }

  // Future registerWithPhone({
  //   required String phoneNo,
  // }) async {
  //   firebaseAuth.verifyPhoneNumber(
  //       phoneNumber: phoneNo,
  //       timeout: const Duration(hours: 2),
  //       verificationCompleted: (AuthCredential authCredential) async {
  //         await fireStoreService.updatePhone(phoneNo);
  //         Get.offAllNamed(Routes.preferenceScreen);
  //       },
  //       verificationFailed:
  //           (FirebaseAuthException firebaseAuthException) async {
  //         throw Failure(firebaseAuthException.message.toString());
  //       },
  //       codeSent: (String? verificationId, [int? forceResendingToken]) {
  //         Get.offAllNamed(Routes.verifyPhone);
  //       },
  //       codeAutoRetrievalTimeout: null);
  // }

  Future<AppUser?> login({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final UserCredential _userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      if (_userCredential.user!.emailVerified) {
        //return await userCredential.uid;
        //return null;

        String userId = _userCredential.user!.uid;
        return await fireStoreService.getUserWithId(userId);
      } else {
        await _userCredential.user?.sendEmailVerification();
        throw Failure(
            'User email not verified, Verification link has been sent to your email');
      }
    } on FirebaseAuthException catch (ex) {
      throw Failure(ex.message ?? 'Something went wrong!');
    }
  }
  //
  // Future<User?> loginWithGoogle() async {
  //   final googleSignInAccount = await googleSignIn.signIn();
  //
  //   if (googleSignInAccount != null) {
  //     final googleSignInAuth = await googleSignInAccount.authentication;
  //
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuth.accessToken,
  //       idToken: googleSignInAuth.idToken,
  //     );
  //
  //     try {
  //       final UserCredential _userCredential =
  //           await firebaseAuth.signInWithCredential(credential);
  //
  //       return _userCredential.user;
  //     } on FirebaseAuthException catch (ex) {
  //       throw Failure(ex.message ?? 'Something went wrong!');
  //     }
  //   }
  // }
  //
  // Future<void> resetPassword(String emailAddress) async {
  //   try {
  //     await firebaseAuth.sendPasswordResetEmail(email: emailAddress);
  //   } on FirebaseAuthException catch (ex) {
  //     throw Failure(ex.message ?? 'Something went wrong!');
  //   }
  // }
  //
  // Future<void> updateUser({required String fullName}) async {
  //   try {
  //     await currentUser?.updateDisplayName(fullName);
  //   } on FirebaseAuthException catch (ex) {
  //     throw Failure(ex.message ?? 'Something went wrong!');
  //   }
  // }
  //
  // Future<void> updateEmail({
  //   required String newEmailAddress,
  //   required String password,
  // }) async {
  //   try {
  //     final AuthCredential authCredential = EmailAuthProvider.credential(
  //       email: currentUser!.email!,
  //       password: password,
  //     );
  //
  //     await currentUser?.reauthenticateWithCredential(authCredential);
  //
  //     await currentUser?.updateEmail(newEmailAddress);
  //
  //     await currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (ex) {
  //     throw Failure(ex.message ?? 'Something went wrong!');
  //   }
  // }
  //
  // Future<void> updatePassword({
  //   required String oldPassword,
  //   required String newPassword,
  // }) async {
  //   try {
  //     final AuthCredential authCredential = EmailAuthProvider.credential(
  //       email: currentUser!.email!,
  //       password: oldPassword,
  //     );
  //
  //     await currentUser?.reauthenticateWithCredential(authCredential);
  //
  //     await currentUser?.updatePassword(newPassword);
  //   } on FirebaseAuthException catch (ex) {
  //     throw Failure(ex.message ?? 'Something went wrong!');
  //   }
  // }
  //
  // Future<String> deleteUser() async {
  //   try {
  //     final HttpsCallable callable = firebaseFunctions.httpsCallable(
  //       'deleteUserAccount',
  //       options: HttpsCallableOptions(timeout: const Duration(seconds: 10)),
  //     );
  //
  //     final result = await callable();
  //
  //     logout();
  //
  //     return result.data;
  //   } on FirebaseFunctionsException catch (ex) {
  //     throw Failure(ex.message ?? 'Something went wrong!');
  //   }
  // }
  //
  // Future<void> logout() async {
  //   if (!kIsWeb) {
  //     await googleSignIn.signOut();
  //   }
  //   await firebaseAuth.signOut();
  // }
}

final authRepository = AuthenticationRepository(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFunctions: FirebaseFunctions.instance,
    googleSignIn: GoogleSignIn());
