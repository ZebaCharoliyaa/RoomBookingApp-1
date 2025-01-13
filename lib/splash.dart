// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//    Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:  Color.fromARGB(255, 193, 124, 19),
//       body: Stack(
//         children: [
//          Center(
//            child: Column(
//             children: [
//               Image.asset("assets/images/logo.png"),
//               Positioned(
//                 bottom: 300,
//                 child: RichText(
//                     text: TextSpan(
//                         text: "Wander",
//                         style: TextStyle(fontSize: 42),
//                         children: <TextSpan>[
//                       TextSpan(text: 'Stay', style: TextStyle(color: Colors.white))
//                     ])),
//               ),
//             ],
//                    ),
//          ),
//       ]),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:roombooking/home.dart';

class Splash extends StatefulWidget {
   Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
     Timer(
            Duration(seconds: 1),
                () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Home())));
    return Scaffold(
    
      backgroundColor:  Colors.orange,
      body:
              
         // Text below the image
         Center(
          
           child: RichText(
             
             text: TextSpan(
               text: "Wander",
               style:  TextStyle(
                 fontSize: 42,
                 color: Colors.black
               ),
               children:  <TextSpan>[
                 TextSpan(
                   text: ' Stay',
                   style: TextStyle(
                     color: Color.fromARGB(255, 242, 228, 228),
                   ),
                 ),
               ],
             ),
           ),
         ),
     
    );
  }
}
