/* 
This is the flutter leaning lecture 78 where we will learn about how to map a list into a widget
for example we seen in messenger the list of all chats are of similar types only the content of list 
are changed in this case in instead of creating widget for all list we will make a list of array in one 
and we use map() to map itin to widget .
Lets demonstrate with example */
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
    {'name': 'sijan', 'Mobile no': '9819787484', 'Unread': '3'},
    {'name': 'Rajan', 'Mobile no': '9819787484', 'Unread': '2'},
    {'name': 'Mausam', 'Mobile no': '9819787484', 'Unread': '1'},
    {'name': 'Gaurav', 'Mobile no': '9819787484', 'Unread': '4'},
    {'name': 'Nabaraj', 'Mobile no': '9819787484', 'Unread': '5'},
    {'name': 'Hari Karki', 'Mobile no': '9819787484', 'Unread': '6'},
    {'name': 'Dilsan', 'Mobile no': '9819787484', 'Unread': '2'},
    /* 'sijan',
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
    'Parmeshwor',*/
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
            return ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(value['name'].toString()),
              subtitle: Text(value['Mobile no'].toString()),
              trailing: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.green,
                  child: Text(value['Unread'].toString())),
            );
            /*   return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.blue,
                ),
                child: Center(child: Text(value)),
              ),
            );*/
          }).toList()),
        ));
  }
}
