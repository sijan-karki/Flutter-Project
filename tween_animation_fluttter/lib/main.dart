/*
Tween animations are a common technique used in Flutter to create smooth transitions between values, such as animating the position,
 size, opacity, or color of widgets. I'll provide you with a simple example of how to create a Tween animation in Flutter.*/
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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  /*
    _MyHomePageState is where the animation logic is implemented. It extends State<MyHomePage>
     and includes the SingleTickerProviderStateMixin, which is used for the animation controller.*/
  @override
  late Animation animation;
  late AnimationController animationController;
  late Animation animationcolor;
  @override
  void initState() {
    /*
  In the initState() method of _MyHomePageState, the animation controller is initialized, and two animations are set up: animation for changing
  the size of the container and animationcolor for changing the background color of the container.*/

    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    //The animation is defined using a Tween that animates the value from 0.0 to 200.0 over a duration of 4 seconds.
    animation = Tween(begin: 0.0, end: 200).animate(animationController);
    animationcolor = ColorTween(begin: Colors.blue, end: Colors.orange)
        //the animationcolor is defined using a ColorTween that animates the color from blue to orange over the same 4-second duration
        .animate(animationController);
    animationController.addListener(() {
      /*
      An event listener is attached to the animation controller using addListener(). Inside the listener, the setState() method is called, 
      which triggers a rebuild of the UI every time the animation value changes. 
      This allows the container's size and color to be updated during the animation.*/
      print(animation.value);
      setState(() {});
    });
    animationController
        .forward(); //The animation controller is started using animationController.forward() to initiate the animation.
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween"),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: animationcolor.value,
          /*The body of the scaffold consists of a Center widget containing a Container. 
          The width and height of the container are controlled by the animation.value, which changes over time due to the animation. 
          The color of the container is set to animationcolor.value, which also changes gradually during the animation.*/
        ),
      ),
    );
  }
}
