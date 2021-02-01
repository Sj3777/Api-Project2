import 'package:flutter/material.dart';
import 'package:flutter_api_project/HomeScreen.dart';

class VerifyOtp extends StatefulWidget {
  final String text;
  VerifyOtp({Key key, this.text}) : super(key: key);
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
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
                  "text",
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
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    size: 50,
                    color: Colors.lightBlue,
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Text(
                        "Enter your OTP to Register and Log in ")),
                Container(
                  height: 50,
                  width: 260,
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      hintText: "OTP",
                      labelText: "OTP",
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 120),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  }, child: Text("Log in"),color: Colors.lightBlue,shape: StadiumBorder(),)


              ],
            ),
          ),
        )
      ],
    );
  }
}