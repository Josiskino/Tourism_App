
class Sites {
  String name;
  String localisation;
  String image;
  Sites({required this.name, required this.localisation, required this.image});

  static List<Sites> sites() {
    return [
      Sites(name: 'Eiffel Tower', localisation: 'Paris', image: 'assets/images/places/place1.jpg'),
      Sites(name: 'Eiffel Tower', localisation: 'Paris', image: 'images/image1.png'),
      Sites(name: 'Eiffel Tower', localisation: 'Paris', image: 'images/image1.png'),
    ];
  }
    
}