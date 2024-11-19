class TripInfo {
  final String imageUrl;
  final String name;
  final String startLocation;
  final double rating;
  final double pricePerPerson;

  TripInfo({
    required this.imageUrl,
    required this.name,
    required this.startLocation,
    required this.rating,
    required this.pricePerPerson,
  });

  static final List<TripInfo> trips = [
    TripInfo(
      imageUrl: 'https://via.placeholder.com/150x150',
      name: 'Mountain Adventure',
      startLocation: 'New York',
      rating: 4.5,
      pricePerPerson: 120,
    ),
    TripInfo(
      imageUrl: 'https://via.placeholder.com/150x150',
      name: 'Beach Paradise',
      startLocation: 'Miami',
      rating: 4.8,
      pricePerPerson: 150,
    ),
    TripInfo(
      imageUrl: 'https://via.placeholder.com/150x150',
      name: 'City Tour',
      startLocation: 'Chicago',
      rating: 4.3,
      pricePerPerson: 90,
    ),
  ];
}
