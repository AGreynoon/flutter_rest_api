class UserLogin{
  String? username;
  String? password;


  UserLogin({this.username, this.password});

  factory UserLogin.fromJson(Map<String, dynamic> e){
    return UserLogin(
      username: e['username'],
      password: e['password'],
    );
  }
}