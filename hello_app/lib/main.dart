import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void saveData() async {
    DocumentReference aluno =
        FirebaseFirestore.instance.collection('alunos').doc('0');

    await aluno.get().then((DocumentSnapshot doc) async {
      if (doc.exists) {
        return await aluno.update({
          'chave1': 'valor3',
          'chave2': 'valor4',
        });
      } else {
        loadData();
        return await aluno.set({
          'chave1': 'valor1',
          'chave2': 'valor2',
        });
      }
    });
  }

  void loadData() async {
    CollectionReference recordsRef =
        FirebaseFirestore.instance.collection('/alunos/');

    await recordsRef.get().then((QuerySnapshot snapshot) {
      for (var aluno in snapshot.docs) {
        print(aluno.data());
      }
      setState(() {
        _counter = snapshot.docs.length;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) => loadData());
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
