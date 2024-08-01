
class Sites {
  String name;
  String localisation;
  String image;
  Sites({required this.name, required this.localisation, required this.image});

  static List<Sites> sites() {
    return [
      Sites(
        name: 'Eiffel Tower', 
        localisation: 'Paris', 
        image: 'assets/images/places/place4.jpeg'
      ),
      Sites(
        name: 'Eiffel Tower', 
        localisation: 'Paris', 
        image: 'assets/images/places/place2.jpeg'
      ),
      Sites(
        name: 'Eiffel Tower', 
        localisation: 'Paris', 
        image: 'assets/images/places/place9.jpeg'
      ),
    ];
  }
    
}