class UserLocation{
  LocationStreet? street;
  String? city;
  String? state;
  String? country;
  String? postcode;
  LocationCoordinates? coordinates;
  LocationTimeZone? timezone;

  UserLocation({this.street, this.city,
    this.state, this.country,
    this.postcode, this.coordinates,
    this.timezone});

  factory UserLocation.fromJson(Map<String, dynamic> e){
    final street = LocationStreet.fromJson(e['street']);
    final coordinates = LocationCoordinates.fromJson(e['coordinates']);
    final timezone = LocationTimeZone.fromJson(e['timezone']);
    return UserLocation(
      street: street,
      city: e['city'],
      state: e['state'],
      country: e['country'],
      postcode: e['postcode'].toString(),
      coordinates: coordinates,
      timezone: timezone,
    );
  }
}
class LocationStreet{
  int? number;
  String? name;

  LocationStreet({this.number, this.name});
  factory LocationStreet.fromJson(Map<String, dynamic> e){
    return LocationStreet(
      number: e['number'],
      name: e['name'],
    );
  }
}

class LocationCoordinates{
  String? latitude;
  String? longitude;

  LocationCoordinates({this.latitude, this.longitude});
  factory LocationCoordinates.fromJson(Map<String, dynamic> e){
    return LocationCoordinates(
      latitude: e['latitude'],
      longitude: e['longitude'],
    );
  }
}

class LocationTimeZone{
  String? offset;
  String? description;

  LocationTimeZone({this.offset, this.description});
  factory LocationTimeZone.fromJson(Map<String, dynamic> e){
    return LocationTimeZone(
      offset: e['offset'],
      description: e['description'],
    );
  }
}