import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  Favorite({super.key});
  @override
  State<Favorite> createState() => _FavoriteState();
}

final List<Map<String, String>> favoritePlaces = [
  {
    'name': 'Niladri Reservoir',
    'location': 'Tekergat, Sunamgonj',
    'image':
        'https://as1.ftcdn.net/jpg/06/19/00/08/1000_F_619000872_AxiwLsfQqRHMkNxAbN4l5wg1MsPgBsmo.jpg'
  },
  {
    'name': 'Casa Las Trutugas',
    'location': 'Av Damero, Mexico',
    'image':
        'https://t3.ftcdn.net/jpg/09/79/53/60/240_F_979536087_YmIDF56Qtz7i1JiEXv3eXzI5gitM8BvS.jpg'
  },
  {
    'name': 'Ao Nang Villa Resort',
    'location': 'Bastola, Islampur',
    'image':
        'https://as2.ftcdn.net/v2/jpg/09/64/96/87/1000_F_964968792_O79xKuKm2BYv0dFoQ4b1ryvzd4RgNeRD.jpg'
  },
  {
    'name': 'Rangauti Resort',
    'location': 'Sylhet, Airport Road',
    'image':
        'https://t4.ftcdn.net/jpg/06/32/20/07/240_F_632200724_WuOGPlu1XfDjqUinsBGzHXaa8TVtdqD9.jpg',
  },
  {
    'name': 'Kachura Resort',
    'location': 'Vellina, Island',
    'image':
        'https://t3.ftcdn.net/jpg/03/21/78/98/240_F_321789819_Jyv66AM5PoY0j9tZzjkB1c807zQQXtZh.jpg'
  },
  {
    'name': 'Shakardu Resort',
    'location': 'Shakardu, Pakistan',
    'image':
        'https://t3.ftcdn.net/jpg/04/16/48/08/240_F_416480811_HmtgLEq1GLmqy0WpKuAfuaYFn7u08IyF.jpg'
  },
];

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text on top of GridView
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 30, left: 20),
              child: Text(
                'Explore Favorite Places',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // GridView to display the favorite places
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 cards per row
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              itemCount: favoritePlaces.length,
              itemBuilder: (context, index) {
                final place = favoritePlaces[index];
                return FavoritePlaceCard(
                  name: place['name']!,
                  location: place['location']!,
                  image: place['image']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FavoritePlaceCard extends StatelessWidget {
  final String name;
  final String location;
  final String image;

  FavoritePlaceCard({
    Key? key,
    required this.name,
    required this.location,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack to display the image and favorite icon
          Stack(
            children: [
              // Image from network with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        'Image not available',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  },
                ),
              ),
              // Favorite Icon Button at the top-right corner
              Positioned(
                top: 8.0,
                right: 8.0,
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Handle favorite button tap
                    },
                  ),
                ),
              ),
            ],
          ),
          // Content: Name and Location
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
