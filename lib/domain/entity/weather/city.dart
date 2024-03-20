class City {
  final int id;
  final String title;
  final String country;
  final String? state;
  final double lat;
  final double lon;

  City({
    required this.id,
    required this.title,
    required this.country,
    required this.state,
    required this.lat,
    required this.lon,
  });

  @override
  String toString() {
    return 'City{id: $id, title: $title, country: $country, state: $state, lat: $lat, lon: $lon}';
  }
}
