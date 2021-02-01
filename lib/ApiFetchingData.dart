import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScreenBody extends StatefulWidget {
  @override
  _ScreenBodyState createState() => _ScreenBodyState();
}

class _ScreenBodyState extends State<ScreenBody> {
  List users=[];
  bool isLoading= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchUser();
  }
  Future fetchUser() async {
    var url="https://randomuser.me/api/?results=10";
    var response=await http.get(url);
    if(response.statusCode==200){
      var items = json.decode(response.body)['results'];
      setState(() {
        users=items;
      });
    }else{
      setState(() {
        users=[];
      });
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Api App in flutter"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return getCard(users[index]);
        });
  }

  Widget getCard(item) {
    var fullName=item['name']['title']+" "+item['name']['first']+" "+item['name']['last'];
    var image=item['picture']['large'];
    var email=item['email'];
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(7),
          child: ListTile(
            title: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.orange,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(image.toString())
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fullName.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.indigo,
                      ),
                    ),
                    Text(
                      email.toString(),
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}