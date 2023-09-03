class UserPicture{
  String? large;
  String? medium;
  String? thumbnail;

  UserPicture({this.large, this.medium, this.thumbnail});

  factory UserPicture.fromJson(Map<String, dynamic> e){
    return UserPicture(
      large: e['large'],
      medium: e['medium'],
      thumbnail: e['thumbnail'],
    );
  }
}