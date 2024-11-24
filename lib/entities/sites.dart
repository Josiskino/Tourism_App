class Sites {
  final String name;
  final String localisation;
  final String image;
  final String description;
  final String rating;
  final String price;
  final String openingTime;
  final String closingTime;

  Sites({
    required this.name,
    required this.localisation,
    required this.image,
    required this.description,
    required this.rating,
    required this.price,
    required this.openingTime,
    required this.closingTime,
  });

  static List<Sites> sites() {
    return [
      Sites(
        name: 'Pure Beach',
        localisation: 'Lomé,Baguida',
        description: "Explorez une plage paradisiaque où le sable doré caresse vos pieds, et les vagues cristallines dansent sous le soleil. Partez à la découverte des criques cachées et des falaises majestueuses qui offrent une vue imprenable sur l'horizon infini. Les palmiers se balancent doucement dans la brise, créant une oasis de tranquillité. Plongez dans l'eau azur et découvrez un monde sous-marin foisonnant de vie. Savourez des fruits tropicaux frais tout en écoutant le murmure apaisant de la mer. Profitez d'une escapade inoubliable, où chaque moment est empreint de sérénité et de beauté sauvage.",
        rating: '4.3',
        price: '10.000',
        image: 'assets/images/places/place4.jpeg',
        openingTime: '09:00',
        closingTime: '23:00',
      ),
      Sites(
        name: 'Temberma village',
        localisation: 'Kpalimé',
        description: "Niché au cœur des montagnes de l'Atakora, le temple Temberma est un chef-d'œuvre d'architecture traditionnelle. Ce site, classé au patrimoine mondial de l'UNESCO, incarne l'histoire et la culture du peuple Batammariba. Construit en argile et en bois, le temple se dresse majestueusement avec ses formes cylindriques, rappelant les tours de défense d'un autre temps. Ses murs épais, ornés de motifs symboliques, racontent des siècles de rites et de coutumes. Les toits en paille, parfaitement intégrés à l'environnement naturel, offrent une protection contre le soleil ardent. En visitant le temple Temberma, vous plongez dans un passé où chaque pierre, chaque détail a une signification profonde. Un lieu sacré où la spiritualité et l'artisanat se rencontrent pour créer une harmonie parfaite entre l'homme et la nature.",
        rating: '4.0',
        price: '5.000',
        image: 'assets/images/places/place3.jpeg',
        openingTime: '08:00',
        closingTime: '18:00',
      ),
      Sites(
        name: 'Slave house',
        description: "La Maison des Esclaves, située sur la côte sud du Togo, est un témoin silencieux d'une époque sombre de l'histoire africaine. Ce lieu, marqué par la douleur et les larmes, raconte les souffrances de milliers de personnes arrachées à leur terre natale. En franchissant les portes de cette bâtisse austère, on est frappé par l'atmosphère pesante qui règne encore entre ses murs. Les cellules exiguës, à peine éclairées par une lumière tamisée, rappellent les conditions inhumaines dans lesquelles les esclaves étaient détenus avant leur départ forcé vers des terres lointaines. Chaque pierre, chaque couloir porte les empreintes de vies brisées. La Maison des Esclaves n'est pas seulement un lieu de mémoire, mais aussi un site de réflexion sur l'histoire et l'importance de ne jamais oublier ces tragédies. En visitant ce lieu chargé d'émotion, on rend hommage à la résilience et à la dignité de ceux qui ont souffert.",
        rating: '3.5',
        price: '2.000',
        localisation: 'Nyékonakpoè',
        image: 'assets/images/places/place13.jpeg',
        openingTime: '10:00',
        closingTime: '17:00',
      ),
    ];
  }
}