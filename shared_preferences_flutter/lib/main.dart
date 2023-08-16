import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var namecontroller = TextEditingController();
  static const String KEYVALUE = "name";
  var namevalue = "No value Saved";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }

  void getvalue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var getname = prefs.getString(KEYVALUE);
    namevalue = getname ??
        "No value Saved"; // this is like if(getname!=null? getname:"No value Saved")
    // This is ternary operator means if getname is not equal to null than it gets getname otherwise no value saved
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Container(
        child: Center(
          child: SizedBox(
            width: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                      hintText: "name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21))),
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var name = namecontroller.text.toString();
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setString(KEYVALUE, name);
                    },
                    child: Text("Save")),
                SizedBox(
                  height: 11,
                ),
                Text(namevalue)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
