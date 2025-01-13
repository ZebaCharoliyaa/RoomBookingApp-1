import 'package:flutter/material.dart';

void main() {
  runApp(profile());
}

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String profileName = "Gravhia Nare";
  String email = "gravhianare12345@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Background with Profile Image
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(

                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade800, Colors.orange.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: GestureDetector(
                  onTap: () {
                    // Handle profile image tap
                    print("Profile Image Tapped");
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/room1.jpeg'), // Replace with your image
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 70),
          // Options
          Expanded(
            
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  ProfileOption(
                    title: 'Name',
                    value: profileName,
                    onTap: () => _updateProfileName(),
                  ),
                  ProfileOption(
                    title: 'Email',
                    value: email,
                    onTap: () => _updateEmail(),
                  ),
                  ProfileOption(
                    title: 'Date Of Birth',
                    value: '01/01/1990',
                    onTap: () {},
                  ),
                  ProfileOption(
                    title: 'Height and weight',
                    value: '170 cm, 65 kg',
                    onTap: () {},
                  ),
                  ProfileOption(
                    title: 'Subscription',
                    value: 'Premium',
                    onTap: () {},
                  ),
                  ProfileOption(
                    title: 'Customer care',
                    value: '',
                    onTap: () {},
                  ),
                  SizedBox(height: 20),
                  ProfileOption(
                    title: 'Logout Account',
                    isLogout: true,
                    onTap: () {
                      // Handle logout
                      print("Logged out");
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateProfileName() {
    // Example: Open a dialog to update profile name
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController nameController = TextEditingController(text: profileName);
        return AlertDialog(
          title: Text('Update Name'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Enter your name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  profileName = nameController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _updateEmail() {
    // Example: Open a dialog to update email
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController emailController = TextEditingController(text: email);
        return AlertDialog(
          title: Text('Update Email'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: 'Enter your email'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final bool isLogout;

  ProfileOption({
    required this.title,
    this.value = '',
    required this.onTap,
    this.isLogout = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: isLogout ? Colors.red.withOpacity(0.1) : Colors.orange.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: isLogout ? Colors.red : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (value.isNotEmpty)
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
