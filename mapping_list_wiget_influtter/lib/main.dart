import 'package:flutter/material.dart';

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
      theme: ThemeData(primarySwatch: Colors.purple),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var arrdata = [
    'sijan',
    'tara',
    'Sita',
    'Ram',
    'hari',
    'Sitaram',
    'lal prashad',
    'Gaurav',
    'Sanjaya',
    'Lila',
    'Nishan',
    'Parmeshwor',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("mapping_list"),
        ),
        body: Container(
          child: ListView(
              children: arrdata.map((value) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.blue,
                ),
                child: Center(child: Text(value)),
              ),
            );
          }).toList()),
        ));
  }
}
