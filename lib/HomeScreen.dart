import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 200.0)),
            color: Colors.lightBlue,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 100),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "AfyaPass",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Register here",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0), color: Colors.white),
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child:
                  Text(" WELCOME SJ",style: TextStyle(color: Colors.lightBlue,fontSize: 35),),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}