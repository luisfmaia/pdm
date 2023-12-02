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
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(seconds: 2),
//       vsync: this,
//     )
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           _controller.forward();
//         }
//       })
//       ..forward();

//     _animation = CurvedAnimation(
//       parent: _controller,
//       curve: Curves.fastOutSlowIn,
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('IFMA - Campus Caxias'),
//           backgroundColor: Colors.green,
//         ),
//         body: Center(
//           child: AnimatedBuilder(
//             animation: _animation,
//             builder: (BuildContext context, Widget? child) {
//               return ScaleTransition(
//                 scale: _animation,
//                 child: child,
//               );
//             },
//             child: const Image(
//               image: AssetImage('images/ifma.png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
