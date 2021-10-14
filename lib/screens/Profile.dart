import 'package:covid_19_tracker/screens/Login.dart';
import 'package:flutter/material.dart';

class Pofile extends StatefulWidget {
  const Pofile({Key key}) : super(key: key);

  @override
  _PofileState createState() => _PofileState();
}

class _PofileState extends State<Pofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: Container(
          child: Form(
            child: Column(
              children: [
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.login, color: Colors.pinkAccent[700]),
                        Text("Logout")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
