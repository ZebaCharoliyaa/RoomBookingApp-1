import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import 'package:roombooking/booking.dart';
import 'package:roombooking/detail.dart';
import 'package:roombooking/favorite.dart';
import 'package:roombooking/history.dart';
import 'package:roombooking/profile.dart';

class Home extends StatefulWidget {
  Home({super.key});
 
  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      homescreen(),
      Favorite(),
      History(),
      profile()
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Get device pixel ratio (useful for retina displays)
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Check if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // You can also use the padding value to calculate for the safe area.
    EdgeInsets padding = MediaQuery.of(context).padding;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor:
              Colors.transparent, // Set to transparent to avoid overriding
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: 'Booking History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ));
  }
}

class homescreen extends StatelessWidget {
  homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.location_on_outlined)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/room1.jpeg')),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Text(
              'Bali, indonesia',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: ScrollConfiguration(
        behavior:
            ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: 'search hotel....',
                    fillColor: Colors.orange[50],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    //
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 170,
                  // width: 450,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/room6.jpeg',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.transparent.withOpacity(0.6),
                          BlendMode.darken),
                    ),

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Get 50% Discount',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'on room book',
                            style: TextStyle(
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      PrettyWaveButton(
                        backgroundColor: Colors.white,
                        child: const Text(
                          'Get Now',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                  // width: 5,
                ),
                DefaultTabController(
                    length: 4,
                    child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TabBar(
                            isScrollable: true,
                            indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white),
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelStyle: TextStyle(
                              fontSize: 12,
                            ),
                            tabs: [
                              Tab(
                                text: 'All Rooms',
                              ),
                              Tab(
                                text: 'Discounted Rooms',
                              ),
                              Tab(
                                text: 'Top Rooms',
                              ),
                              Tab(
                                text: 'Luxury',
                              ),
                            ],
                          ),
                        ])),

                // SizedBox(height: 100),

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: popularRooms.length,
                      itemBuilder: (context, index) {
                        final room = popularRooms[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Detail()),
                            );
                          },
                          child: Container(
                            width: 200,
                            height: 300,
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(room['imageUrl']),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  top: 150,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 16),
                                      title: Text(
                                        room['title'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            room['price'],
                                            style: TextStyle(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.orange,
                                                size: 14,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                room['rating'].toString(),
                                                style: TextStyle(
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),

                SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),

                // GridView for Popular Rooms
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two cards per row
                    crossAxisSpacing: 10, // Spacing between columns
                    mainAxisSpacing: 10, // Spacing between rows
                    childAspectRatio:
                        0.8, // Adjust the aspect ratio for the card size
                  ),
                  itemCount: popularRooms.length,
                  itemBuilder: (context, index) {
                    final room = popularRooms[index];
                    return RoomCard(
                      title: room['title'],
                      price: room['price'],
                      rating: room['rating'],
                      imageUrl: room['imageUrl'],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> popularRooms = [
  {
    'title': 'The Knickerbocker',
    'price': '\$90/night',
    'rating': 4.8,
    'imageUrl': 'assets/images/room8.jpeg',
  },
  {
    'title': 'Hotel Central',
    'price': '\$75/night',
    'rating': 4.2,
    'imageUrl': 'assets/images/room7.jpeg',
  },
  {
    'title': 'Archer Hotel',
    'price': '\$80/night',
    'rating': 4.5,
    'imageUrl': 'assets/images/room6.jpeg',
  },
  {
    'title': 'Grand Luxury',
    'price': '\$120/night',
    'rating': 4.9,
    'imageUrl': 'assets/images/room4.jpeg',
  },
];

class RoomCard extends StatelessWidget {
  final String title;
  final String price;
  final double rating;
  final String imageUrl;

  RoomCard({
    required this.title,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 12,
                      ),
                      SizedBox(width: 5),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
