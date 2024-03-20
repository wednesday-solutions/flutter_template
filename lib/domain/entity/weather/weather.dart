class Weather {
  final String title;
  final String description;
  final double lat;
  final double lon;
  final double minTemp;
  final double maxTemp;
  final double temp;
  final double feelsLike;
  final String iconUrl;

  Weather({
    required this.title,
    required this.description,
    required this.lat,
    required this.lon,
    required this.minTemp,
    required this.maxTemp,
    required this.temp,
    required this.feelsLike,
    required this.iconUrl,
  });

  @override
  String toString() {
    return 'Weather{title: $title, description: $description, lat: $lat, lon: $lon, minTemp: $minTemp, maxTemp: $maxTemp, temp: $temp, feelsLike: $feelsLike, iconUrl: $iconUrl}';
  }
}
