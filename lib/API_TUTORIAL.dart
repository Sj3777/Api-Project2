import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api_Tutorial extends StatefulWidget {
  @override
  _Api_TutorialState createState() => _Api_TutorialState();
}

class _Api_TutorialState extends State<Api_Tutorial> {

  String stringResponse;
  List users = [];

  Future fetchData() async {
    http.Response response;
    response = await http.get(
        "http://ec2-18-222-107-110.us-east-2.compute.amazonaws.com/MyTours?User_id=30");
    if (response.statusCode == 200) {
      setState(() {
        var items = json.decode(response.body)['Response']['Tours'];
        users = items;
        print(items);
        stringResponse = items;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API RESPONSE"), backgroundColor: Colors.lightGreen,),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return getCard(users[index]);
            })
    );
  }
}

Widget getCard(item) {
  var Content = item['Content'];
  var Description = item['Description'];
  var Disliked = item['Disliked'];
  var Distance = item['Distance'];
  var Duration = item['Duration'];
  var Language = item['Language'];
  var Rating = item['Rating'];
  var Title = item['Title'];
  var Type = item['Type'];
  var Destination_lat = item['Destination_lat'];
  var Destination_long = item['Destination_long'];
  return Padding(
    padding: EdgeInsets.all(5),
    child: Card(
      child: Padding(
        padding: EdgeInsets.all(7),
        child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title : "+ Title.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    color: Colors.teal,
                  ),
                ),
                Text(
                  "Type : "+Type.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue[500],
                  ),
                ),
                Text(
                  "Description : " +Description.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[200],
                  ),
                ),
                Text(
                  "Disliked : "+Disliked.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.redAccent,
                  ),
                ),
                Text(
                  "Distance : "+Distance.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.lightGreen,
                  ),
                ),
                Text(
                  "Duration : "+Duration.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  "Language : "+Language.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  "Rating : "+Rating.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.pinkAccent,
                  ),
                ), Text(
                  "Destination : "+Destination_lat.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  "Destination : "+Destination_long.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow,
                  ),
                ),
              ],
            )
        ),
      ),
    ),
  );
}
