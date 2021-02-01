import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_project/verifyOtp.dart';
import 'verifyOtp.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PhoneLoginApi extends StatefulWidget {
  @override
  _PhoneLoginApiState createState() => _PhoneLoginApiState();
}

class _PhoneLoginApiState extends State<PhoneLoginApi> {
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
  final myController = TextEditingController();
  String phone_number;
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }
  Future fetchUser() async {
    var url="http://localhost:5010/v1/user/create";
    var response=await http.get(url);
    if(response.statusCode==200){
     //var items = json.decode(response.body)['results'];
      setState(() {
        phone_number=json.decode(response.body);
      });
      print(phone_number.toString());
    }
    /*
    final String apiUrl = "https://randomuser.me/api/?results=10";
    Future<List<dynamic>> fetchUsers() async {
      var result = await http.get(apiUrl);
      return json.decode(result.body)['results'];
    }
    String _name(dynamic user){
      return user['name']['title'] + " " + user['name']['first'] + " " +  user['name']['last'];
    }*/

  }
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
              color: Colors.deepPurpleAccent,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 100),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Text(
                    "AsynApp",
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
                    child: Icon(
                      Icons.add_a_photo_rounded,
                      size: 50,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Text(
                          "Enter your phone number we will send a OTP to your number and verify your otp,successful ")),
                  Container(
                    height: 50,
                    width: 260,
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                      ),
                      validator: (myController){
                        if(myController.isEmpty){
                          return "Required";
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30,),
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 15,horizontal: 120),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerifyOtp(text: myController.text)),
                      );
                    }, child: Text("Next"),color: Colors.lightBlue,shape: StadiumBorder(),)


                ],
              ),
            ),
          )
        ],
    );
  }
}
