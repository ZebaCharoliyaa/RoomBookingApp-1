import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:roombooking/Confirmpayment.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange.shade50,
      appBar: AppBar(
        // backgroundColor: Colors.orange.shade100,
        title: Text('Check Out'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shipping Address
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Icon(Icons.location_on, color: Colors.orange),
                title: Text(
                  'Abc',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '+91 9104622646 \n87 imamiya Street nearnew masjid , kanodar',
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Order Summary
            Text('Room Facility',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _orderItem('1 couple', 'no children', 1.32, 0),
                  _orderItem('balcani side view', 'double balcani', 1.32, 0),
                  _orderItem('24 hours', '2 days', 1.32, 0),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Voucher Code
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Enter voucher code...',
            //     border: OutlineInputBorder(),
            //     suffixIcon: ElevatedButton(
            //       style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            //       onPressed: () {},
            //       child: Text('Use'),
            //     ),
            //   ),
            // ),
            SizedBox(height: 20),
            // Go to Payment Button
            SizedBox(
                width: double.infinity,
                height: 50,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle login action
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Confirmpayment()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Go to Payment ->',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  // child: IconButton(
                  //   foregroundColor: Colors.orange,
                  //   icon: Icons.arrow_forward,
                  //   label: "Go to Payment",
                  //   labelStyle: TextStyle(
                  //       fontSize: 18,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.black),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => Confirmpayment()),
                  //     );
                  //   },
                  // ),
                )

                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Confirmpayment()),
                //     );
                //   },
                //   child: Text(
                //     'Go to Payment',
                //     style: TextStyle(color: Colors.white, fontSize: 16),
                //   ),
                // ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _orderItem(String title, String subtitle, double price, int quantity) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: Icon(Icons.shopping_bag, color: Colors.orange),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('$subtitle\n\$${price.toStringAsFixed(2)}'),
        trailing: Text(
          'x$quantity',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      ),
    );
  }
}
