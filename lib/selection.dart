import 'package:flutter/material.dart';
import 'package:pretty_animated_buttons/pretty_animated_buttons.dart';
import 'package:pretty_animated_buttons/widgets/pretty_capsule_button.dart';
import 'package:roombooking/home.dart';

void main() {
  runApp(HotelBookingApp());
}

class HotelBookingApp extends StatelessWidget {
  HotelBookingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Selection(),
    );
  }
}

class Selection extends StatelessWidget {
  Selection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/room3.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          "Welcome Back!",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Discover the Perfect Stay with WanderStay",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildInputFieldWithButton(
                          "Where?",
                          "Ex: New York",
                          Icons.location_on,
                          () {},
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildInputFieldWithButton(
                                "Check-in",
                                "DD/MM/YY",
                                Icons.calendar_today,
                                () {
                                  _selectDate(context, "Check-in");
                                },
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildInputFieldWithButton(
                                "Check-out",
                                "DD/MM/YY",
                                Icons.calendar_today,
                                () {
                                  _selectDate(context, "Check-out");
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildCounterField("Guests", Icons.person),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _buildCounterField(
                                  "Room", Icons.meeting_room),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Center(
                          child: PrettyWaveButton(
                      backgroundColor: Colors.orange,
                            child: const Text(
                              'Find Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Future.delayed(Duration(seconds: 1), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, String label) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      print("Selected $label Date: $formattedDate");
    }
  }

  Widget _buildInputFieldWithButton(
    String label,
    String hint,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          readOnly: true,
          decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(icon, color: Colors.orange),
              onPressed: onPressed,
            ),
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.blueGrey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.orange),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCounterField(String label, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Container(
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: Colors.orange,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),

              ),
              child:  IconButton(
                onPressed: () {},
                icon: const Icon(Icons.remove, color: Colors.white),
              ),
             ),
              const Text(
                "1",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
             Container(
              width: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                color: Colors.orange,
                borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12)),

              ),
              child:  IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white),
              ),
             ),
            ],
          ),
        ),
      ],
    );
  }
}
