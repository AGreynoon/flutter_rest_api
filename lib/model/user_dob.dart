class UserDob{
  DateTime? date;
  int? age;

  UserDob({this.date, this.age});

  factory UserDob.fromJson(Map<String, dynamic> e){
    return UserDob(
      age: e['age'],
      date: DateTime.parse(e['date']),
    );
  }
}