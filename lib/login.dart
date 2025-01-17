import 'package:flutter/material.dart';
import 'package:roombooking/home.dart';
import 'package:roombooking/selection.dart';
import 'package:roombooking/signup.dart';

class Login extends StatefulWidget {
   Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:  Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back navigation
          },
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            padding:  EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Welcome Text
                  RichText(
                    text:  TextSpan(
                      text: "Welcome",
                      style: TextStyle(
                        fontSize: 42,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Back !',
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text("We missed you! Login to continue your journey\n with us",textAlign: TextAlign.center,),
                   SizedBox(height: 30),
              
                  // Email TextField
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon:  Icon(Icons.email_outlined),
                      filled: true,
                      fillColor: Colors.orange[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 20),
              
                  // Password TextField
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon:  Icon(Icons.lock_outline),
                      suffixIcon:  Icon(Icons.visibility_outlined),
                      filled: true,
                      fillColor: Colors.orange[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                   SizedBox(height: 10),
              
                  // Forgot Password Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  ),
                   SizedBox(height: 20),
              
                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle login action
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>Selection() ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize:  Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:  Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                   SizedBox(height: 30),
              
                  // Or Login with
                  Row(
                    children:  [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or Continue with'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                   SizedBox(height: 10),
              
                  // Social Media Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/facebook.png'),
                        ),
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                      IconButton(
                        icon: SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/google.jpeg'),
                        ),
                        onPressed: () {
                          // Handle Google login
                        },
                      ),
                      IconButton(
                        icon: SizedBox(
                          width: 30,
                          height: 25,
                          child: Image.asset('assets/images/instagram.jpeg'),
                        ),
                        onPressed: () {
                         
                        },
                      ),
                    ],
                  ),
                   SizedBox(height: 20),
              
                  // Register Now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                                      MaterialPageRoute(builder:( context)=> Signup(),));
                        },
                        child: Text(
                          'Register Now',
                          style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
