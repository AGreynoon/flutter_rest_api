import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_location.dart';
import 'package:flutter_rest_api/model/user_login.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:flutter_rest_api/model/user_picture.dart';

class User{
  String? gender;
  String? email;
  String? phone;
  String? cell;
  String? nat;
  UserName? name;
  UserDob? dob;
  UserLocation? location;
  UserPicture? picture;
  UserLogin? login;

  User({this.gender, this.email, this.phone, this.cell,
    this.nat, this.name, this.dob, this.location, this.picture, this.login});

  factory User.fromJson(Map<String, dynamic> e){
    final name = UserName.fromJson(e['name']);
    final dob = UserDob.fromJson(e['dob']);
    final location = UserLocation.fromJson(e['location']);
    final picture = UserPicture.fromJson(e['picture']);
    final login = UserLogin.fromJson(e['login']);
    return User(
      name: name,
      gender: e['gender'],
      email: e['email'],
      phone: e['phone'],
      cell: e['cell'],
      nat: e['nat'],
      dob: dob,
      location: location,
      picture: picture,
      login: login,
    );
  }
  String get fullName{
    return '${name?.title} ${name?.first} ${name?.last}';
  }
}
