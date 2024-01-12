class CityModel {
  String city;
  double latitude;
  double longitude;

  CityModel({
    required this.city,
    required this.latitude,
    required this.longitude
  });
  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      city: map['city'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  @override
  String toString() {
    return 'CityCoordinates(city: $city, latitude: $latitude, longitude: $longitude)';
  }
}
