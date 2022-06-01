class UserParams {
  final String fullName;
  final String emailAddress;
  final String password;
  final String phoneNumber;
  final String location;

  UserParams({
    required this.phoneNumber,
    required this.location,
    required this.fullName,
    required this.emailAddress,
    required this.password,
  });
}
