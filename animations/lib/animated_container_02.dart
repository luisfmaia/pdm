// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const AnimationApp(),
//     );
//   }
// }

// class AnimationApp extends StatefulWidget {
//   const AnimationApp({super.key});

//   @override
//   State<AnimationApp> createState() => _AnimationAppState();
// }

// class _AnimationAppState extends State<AnimationApp> {
//   double _width = 100;

//   void animar() {
//     setState(() {
//       _width = (_width >= 400) ? 100 : _width * 2;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text('IFMA - Campus Caxias'),
//             backgroundColor: Colors.green,
//           ),
//           backgroundColor: Colors.white,
//           body: Center(
//             child: Column(
//               children: [
//                 AnimatedContainer(
//                   width: _width,
//                   duration: const Duration(seconds: 1),
//                   curve: Curves.bounceOut,
//                   child: const Image(
//                     image: AssetImage('images/ifma.png'),
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: animar,
//                   child: const Text('Animar'),
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
