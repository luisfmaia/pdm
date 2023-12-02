// // ignore: file_names
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

// class _AnimationAppState extends State<AnimationApp>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void start() {
//     _controller.forward();
//   }

//   void pause() {
//     _controller.stop();
//   }

//   void loop() {
//     _controller.repeat();
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
//           body: Column(
//             children: [
//               RotationTransition(
//                 alignment: Alignment.center,
//                 turns: _controller,
//                 child: const Image(
//                   image: AssetImage('images/ifma.png'),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                         icon: const Icon(Icons.play_arrow), onPressed: start),
//                     IconButton(icon: const Icon(Icons.pause), onPressed: pause),
//                     IconButton(icon: const Icon(Icons.loop), onPressed: loop),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
