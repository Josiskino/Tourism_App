class Categories {
  String name;
  Categories({required this.name});

  static List<Categories> categories() {
    return [
      Categories(name: 'All'),
      Categories(name: 'Popular'),
      Categories(name: 'Recommended'),
      Categories(name: 'Most Viewed'),
      Categories(name: 'Most liked'),
    ];
  }
}