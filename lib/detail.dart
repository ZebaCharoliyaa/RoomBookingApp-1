import 'package:flutter/material.dart';
import 'package:roombooking/booking.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
    body: SingleChildScrollView(
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // // Logo and Header
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Wander',
              //         style: TextStyle(
              //           fontSize: 32,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.black,
              //         ),
              //       ),
              //       Text(
              //         'Stay',
              //         style: TextStyle(
              //           fontSize: 32,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.orange,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
      
              // Image
              ClipRRect(
                borderRadius: BorderRadius.only(

                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                
                child: Image.asset('assets/images/room8.jpeg',
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
      
              // Title and Price Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Executive Suite',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'A luxurious suite featuring a living area, king-size bed, and a dedicated workspace.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$30 Per Night',
                              style: TextStyle(fontSize: 16, color: Colors.grey, decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              'After 30% OFF',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
                            ),
                            Text(
                              '\$21 Per Night',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ],
                        ),
                      //   ElevatedButton(
                      //     onPressed: () {},
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.orange,
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //     child: Text(''),
                      //   ),
                      ],
                    ),
                  ],
                ),
              ),
      
              // Key Features Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key Features',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        FeatureChip(label: 'Spacious'),
                        FeatureChip(label: 'Luxurious'),
                        FeatureChip(label: 'Wi-Fi'),
                        FeatureChip(label: 'Workspace'),
                      ],
                    ),
                  ],
                ),
              ),
      
              
            SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()));
                       
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              
            ],
          ),
    ),
      );
  }
}

class FeatureChip extends StatelessWidget {
  final String label;

  const FeatureChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
