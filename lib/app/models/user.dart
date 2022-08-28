class User {
  final String emailAddress;
  final String password;

  const User({required this.emailAddress, required this.password});

  Map<String,dynamic> toJson () => {
    "emailAddress":emailAddress,
  "password":password
  };

}
