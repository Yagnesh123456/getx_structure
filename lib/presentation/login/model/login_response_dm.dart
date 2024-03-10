class LoginResponseDM {
  final String token;
  final UserDetails userDetails;

  LoginResponseDM({
    required this.token,
    required this.userDetails,
  });

  factory LoginResponseDM.fromJson(Map<String, dynamic> json) {
    return LoginResponseDM(
      token: json['token'],
      userDetails: UserDetails.fromJson(json['userDetails']),
    );
  }
}

class UserDetails {
  final String username;
  final String email;

  UserDetails({
    required this.username,
    required this.email,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      username: json['username'],
      email: json['email'],
    );
  }
}