import 'package:covid_19_tracker/services/AuthService.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'Login.dart';

class Registre extends StatefulWidget {
  const Registre({Key key}) : super(key: key);

  @override
  _RegistreState createState() => _RegistreState();
}

class _RegistreState extends State<Registre> {
  String _email = "";
  String _cnie = "";
  String _password = "";
  String _checkPassword = "";
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text("Regsitre To Covid19 Tracker"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset("assets/images/covid.png"),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_outline), hintText: 'CNIE'),
              onChanged: (val) => {
                setState(() {
                  _cnie = val;
                }),
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined), hintText: 'email'),
              onChanged: (val) => {
                setState(() {
                  _email = val;
                })
              },
              validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
            ),
            TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), hintText: 'Password'),
                obscureText: true,
                validator: (val) =>
                    val.length < 6 ? 'Enter a valid password 6+ Chars' : null,
                onChanged: (val) => {
                      setState(() {
                        _password = val;
                      })
                    }),
            TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock), hintText: 'Verify Password'),
                obscureText: true,
                onChanged: (val) => {
                      setState(() {
                        _checkPassword = val;
                      })
                    }),
            Container(
              child: RaisedButton(
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(_email, _password);
                    if(result == null) {
                      setState(() {
                        error = 'Please enter a valid email';
                      });
                    }
                    else{
                      Navigator.pop(context);
                    }
                  }
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                color: Colors.pink,
              ),
              margin: const EdgeInsets.only(top: 20.0),
            ),
            Container(
              child: InkWell(
                child: Text('Already have an account?',
                    style: TextStyle(color: Colors.pink)),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              ),
              margin: EdgeInsets.only(top: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
