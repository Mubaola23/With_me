import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final String location;
  final String photoUrl;

  AppUser({
    required this.emailAddress,
    required this.location,
    required this.firstName,
    required this.phoneNumber,
    required this.lastName,
    required this.photoUrl,
  });

  factory AppUser.fromDocumentSnapshot(DocumentSnapshot snapshot) => AppUser(
      emailAddress: snapshot['emailAddress'] ?? '',
      phoneNumber: snapshot['phoneNumber'] ?? '',
      location: snapshot['location'] ?? '',
      lastName: snapshot['lastName'] ?? '',
      firstName: snapshot['firstName'] ?? '',
      photoUrl: snapshot['photoUrl']);
}
