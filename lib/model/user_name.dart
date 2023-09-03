class UserName{
  String? title;
  String? first;
  String? last;

  UserName({this.title, this.first, this.last});

  factory UserName.fromJson(Map<String, dynamic> e){
    return UserName(
      title: e['title'],
      first: e['first'],
      last: e['last'],
    );
  }
}