import 'package:flutter/material.dart';
// import 'package:pretty_animated_buttons/widgets/pretty_slide_underline_button.dart';
import 'package:pretty_animated_buttons/widgets/pretty_slide_up_button.dart';
import 'package:roombooking/payment.dart';

class Booking extends StatefulWidget {
  Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final Color btnColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Your Booking '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Hotel Image and Details Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      'assets/images/room3.jpeg',
                      // Replace with actual image URL
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Blue Nature',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                size: 16, color: Colors.blueGrey),
                            SizedBox(width: 4),
                            Text('South Kuta',
                                style: TextStyle(color: Colors.blueGrey)),
                            Spacer(),
                            Text('\$80/Night',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.orange)),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.orange, size: 16),
                            Text('4.9', style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Booking Details
            Text(
              'Order Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildBookingRow('Check-In', '27 Aug, 2022'),
                    Divider(),
                    _buildBookingRow('Check-Out', '2 Sep, 2022'),
                    Divider(),
                    _buildBookingRow('Room Type', 'Deluxe Room'),
                    Divider(),
                    _buildBookingRow('Capacity', 'Double Bed'),
                    Divider(),
                    _buildBookingRow('Total Price', '\$560', isPrice: true),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Reschedule Section
            Text(
              'Reschedule',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),

            Row(
              children: [
                Expanded(
                  child:
                      _buildDatePicker(context, 'Previous Date', '08/27/2022'),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: _buildDatePicker(context, 'New Date', '08/27/2022'),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Proceed Button
            SizedBox(
              width: double.infinity,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    // color: Colors.orange,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: PrettySlideUpButton(
                    bgColor: btnColor,
                    firstChild: Text(
                      "Proceed..",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    secondChild: Text(
                      "processing to payment.... ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Payment()),
                        );
                      });
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildBookingRow(String title, String value, {bool isPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.blueGrey),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isPrice ? FontWeight.bold : FontWeight.normal,
            color: isPrice ? Colors.orange : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(BuildContext context, String label, String date) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 14, color: Colors.blueGrey)),
      SizedBox(height: 4),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(date, style: TextStyle(fontSize: 14)),
            IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2025),
                ).then((pickedDate) {
                  if (pickedDate != null && pickedDate != DateTime.now()) {
                    // You can handle the picked date here
                  }
                });
              },
              icon: Icon(Icons.calendar_today, color: Colors.blueGrey.shade300),
            ),
          ],
        ),
      ),
    ]);
  }
}
