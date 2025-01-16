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
    'imageUrl': 'https://t4.ftcdn.net/jpg/01/04/13/57/240_F_104135791_1cLZHNM7Y74TFsLKtG08JcfbIe3SiRma.jpg',
  },
  {
    'name': 'Casa Las Trutugas',
    'location': 'Av Damero, Mexico',
    'image': 'assets/images/room3.jpeg',
  },
  {
    'name': 'Ao Nang Villa Resort',
    'location': 'Bastola, Islampur',
    'image': 'assets/images/room5.jpeg',
  },
  {
    'name': 'Rangauti Resort',
    'location': 'Sylhet, Airport Road',
    'image': 'assets/images/room8.jpeg',
  },
  {
    'name': 'Kachura Resort',
    'location': 'Vellina, Island',
    'image': 'assets/images/room1.jpeg',
  },
  {
    'name': 'Shakardu Resort',
    'location': 'Shakardu, Pakistan',
    'image': 'assets/images/room2.jpeg',
  },
];

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Get device pixel ratio (useful for retina displays)
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Check if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // You can also use the padding value to calculate for the safe area.
    EdgeInsets padding = MediaQuery.of(context).padding;
  // final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // appBar: AppBar(

      //   centerTitle: true,
      // ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Text on top of GridView
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding:  EdgeInsets.only(top: 30,left: 20),
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
        // SizedBox(height: 8),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 cards per row
              mainAxisSpacing: 16,
                crossAxisSpacing:16,
                childAspectRatio: 0.85,
            ),
            itemCount: favoritePlaces.length,
            itemBuilder: (context, index) {
              final place = favoritePlaces[index];
              return FavoritePlaceCard(
                name: place['name']!,
                location: place['location']!,
                image: place['imageUrl']!,
              );
            },
          ),
        ),
      ]),
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
      elevation: 0, // Adds shadow
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(12.0), // Rounded corners for the Card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack to display the image and favorite icon
          Stack(
            children: [
              // Image with rounded corners
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    image,
                    height: 140,
                    //width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Favorite Icon Button at the top-right corner
              Positioned(
                top: 8.0,
                right: 8.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent.withOpacity(0.5),
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
                // Text(
                  // name,
                  // style: TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.bold,
                  // ),
                // ),
                // SizedBox(height: 4),
                // Text(
                //   location,
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Colors.grey,
                //   ),
                // ),
              ],
            ),
          ),
          Padding(padding: 
          EdgeInsets.all(8.0),
          child: Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              location,
              style: TextStyle(fontSize: 12, color: Colors.grey),

            ),

          )
        ],
      ),
    );
  }
}
