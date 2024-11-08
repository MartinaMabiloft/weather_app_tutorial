class FamousCity {
  final String name;
  final double lat;
  final double long;

  const FamousCity({
    required this.name,
    required this.lat,
    required this.long,
  });
}

List<FamousCity> famousCities = [
  const FamousCity(name: "Milan", lat: 45.4654219, long: 9.1859243),
  const FamousCity(name: 'Rome', lat: 41.9028, long: 12.4964),
  const FamousCity(name: 'Paris', lat: 48.856614, long: 2.3522219),
  const FamousCity(name: 'London', lat: 51.5073509, long: -0.1277583),
  const FamousCity(name: 'Berlin', lat: 52.5200066, long: 13.404954),
  const FamousCity(name: 'Barcelona', lat: 41.3851, long: 2.1734),
  const FamousCity(name: 'Lisboa', lat: 38.736946, long: -9.142685),
  const FamousCity(name: 'Istanbul', lat: 41.0082, long: 28.9784),
  const FamousCity(name: 'Moscow', lat: 55.755826, long: 37.6173),
  const FamousCity(name: 'Tokyo', lat: 35.6828387, long: 139.7594549),
  const FamousCity(
    name: "New York",
    lat: 40.7128,
    long: -74.0060,
  ),
  const FamousCity(
    name: "Los Angeles",
    lat: 34.0522,
    long: -118.2437,
  )
];
