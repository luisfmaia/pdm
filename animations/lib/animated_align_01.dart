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
//   bool _align = true;

//   void animar() {
//     setState(() {
//       _align = !_align;
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
//           body: AnimatedAlign(
//             duration: const Duration(milliseconds: 1500),
//             curve: Curves.easeOutCubic,
//             alignment: _align ? Alignment.bottomCenter : Alignment.topCenter,
//             child: InkWell(
//               onTap: animar,
//               child: const Image(
//                 width: 200,
//                 image: AssetImage('images/ifma.png'),
//               ),
//             ),
//           )),
//     );
//   }
// }
