import 'package:covid_19_tracker/screens/Home.dart';
import 'package:covid_19_tracker/screens/Registre.dart';
import 'package:covid_19_tracker/services/AuthService.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = '';
  String _password = '';
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The Text Bar on the top
        title: Text('Login Covid-19 Tracker'), // giving it a title
        actions: [
          // ignore: deprecated_member_use
          FlatButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Registre()));
              },
              icon: Icon(Icons.person),
              label: Text('Registre'))
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/covid.png'),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Mail',
                    filled: true),
                onChanged: (val) {
                  setState(() {
                    _email = val;
                  });
                },
                validator: (val) => val.isEmpty ? 'Enter a valid email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'Password',
                    filled: true),
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    _password = val;
                  });
                },
                validator: (val) =>
                    val.length < 6 ? 'Enter a valid password 6+ Chars' : null,
              ),
              Container(
                child: RaisedButton(
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          _email, _password);
                      if (result == null) {
                        print('error SignIn!!!');
                        setState(() {
                          error = 'Error SignIn!!!';
                        });
                      } else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    }
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  color: Colors.pink,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
