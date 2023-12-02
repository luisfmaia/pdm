// import 'dart:math';
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
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text('IFMA - Campus Caxias'),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.white,
//       body: Center(
//           child: TweenAnimationBuilder<double>(
//         tween: Tween<double>(begin: 0, end: 2 * pi),
//         duration: const Duration(seconds: 5),
//         curve: Curves.fastOutSlowIn,
//         child: Image.asset('images/ifma.png'),
//         builder: (BuildContext context, double value, Widget? child) {
//           return Transform.rotate(
//             angle: value,
//             child: child,
//           );
//         },
//       )),
//     ));
//   }
// }

// // class _AnimationAppState extends State<AnimationApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: const Text('IFMA - Campus Caxias'),
// //           backgroundColor: Colors.green,
// //         ),
// //         backgroundColor: Colors.white,
// //         body: Center(
// //           child: TweenAnimationBuilder<TextStyle>(
// //             tween: TextStyleTween(
// //               begin: const TextStyle(
// //                   fontSize: 20,
// //                   color: Colors.green,
// //                   backgroundColor: Colors.white38),
// //               end: const TextStyle(
// //                   fontSize: 40,
// //                   fontWeight: FontWeight.bold,
// //                   fontStyle: FontStyle.italic,
// //                   color: Colors.red,
// //                   backgroundColor: Colors.amber),
// //             ),
// //             duration: const Duration(seconds: 2),
// //             builder: (BuildContext context, TextStyle value, Widget? child) {
// //               return Text(
// //                 'Texto animado',
// //                 style: value,
// //               );
// //             },
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }