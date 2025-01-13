import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/widgets/pretty_wave_button.dart';
import 'package:roombooking/booking.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  
  final List<Map<String, dynamic>> events = [
    {
      'title': 'RedFish Lake',
      'location': 'Idaho',
      'price': '\$40 / Visit',
      'image': 'assets/images/room1.jpeg', // Placeholder Image
      'rating': 4.5,
    },
    {
      'title': 'Mountainous Trip',
      'location': 'Sheriburg',
      'price': '\$50 / Visit',
      'image': 'assets/images/room5.jpeg', // Placeholder Image

      'rating': 4.5,
    },
    {
      'title': 'King + Duke',
      'location': 'Toronto',
      'price': '\$130 / 1 day visit',
      'image': 'assets/images/room4.jpeg', // Placeholder Image

      'rating': 4.5,
    },
    {
      'title': 'King + Duke',
      'location': 'Toronto',
      'price': '\$130 / 1 day visit',
      'image': 'assets/images/room6.jpeg', // Placeholder Image

      'rating': 4.5,
    },
    {
      'title': 'King + Duke',
      'location': 'Toronto',
      'price': '\$130 / 1 day visit',
      'image': 'assets/images/room8.jpeg', // Placeholder Image

      'rating': 4.5,
    },
    {
      'title': 'King + Duke',
      'location': 'Toronto',
      'price': '\$130 / 1 day visit',
      'image': 'assets/images/room1.jpeg', // Placeholder Image

      'rating': 4.5,
    },
    {
      'title': 'King + Duke',
      'location': 'Toronto',
      'price': '\$130 / 1 day visit',
      'image': 'assets/images/room2.jpeg', // Placeholder Image

      'rating': 4.5,
    },
  ];

  // Function should be inside the _HistoryState class to access setState and context
  void bookNowAction(String title) {
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Booking()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You booked a Room to $title'),
          duration: const Duration(seconds: 2),
        ),
      );
    });
  }

  Widget buildCard(Map<String, dynamic> item) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    // Get device pixel ratio (useful for retina displays)
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Check if the device is in portrait or landscape mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    // You can also use the padding value to calculate for the safe area.
    EdgeInsets padding = MediaQuery.of(context).padding;
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              item['image'],
              width: 100,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  item['location'],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item['price'],
                  style: const TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.orange, size: 16),
                  Text(
                    item['rating'].toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              // TextButton(
              //   onPressed: () => bookNowAction(item['title']),
              //   style: TextButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(horizontal: 12),
              //     backgroundColor: Colors.orange,
              //     foregroundColor: Colors.white,
              //   ),
              //   child: const Text('Book Now'),
              // ),
              Container(
                  height: 60,
                  width: 200,
                child: PrettyWaveButton(
                  
                  backgroundColor: Colors.orange,
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    });
                  },
                  
                
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Saved Trips'),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 30),
                child: const Text(
                  'History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ...events.map(buildCard).toList(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
