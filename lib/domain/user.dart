class User {
  int? userId;
  String? username;
  String? name;
  String? email;
  String? phone;
  String? type;
  String? token;
  String? renewalToken;

  User(
      {this.userId,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.type,
      this.token,
      this.renewalToken});

  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        userId: responseData['id'],
        name: responseData['name'],
        username: responseData['username'],
        email: responseData['email'],
        phone: responseData['phone'],
        type: responseData['type'],
        token: responseData['access_token'],
        renewalToken: responseData['renewal_token']);
  }
}
