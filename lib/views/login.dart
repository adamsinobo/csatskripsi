import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:hello_world/util.dart';
import 'package:hello_world/views/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSingIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSingIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http.post("http://${util.url}/c-sat/api/login.php",
        body: {"username": username, "password": password});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String namaAPI = data['nama'];
    String fotoAPI = data['foto'];
    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, namaAPI, fotoAPI);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String nama, String foto) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("foto", foto);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");
      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSingIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSingIn;
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSingIn:
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: Form(
              key: _key,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: 56.0,
                      ),
                      GradientText(
                        "C-SAT",
                        gradient: LinearGradient(
                            colors: [Colors.green, Colors.green[200]]),
                        style: TextStyle(
                            fontSize: 54, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 56.0,
                      ),
                      TextFormField(
                        validator: (e) {
                          if (e.isEmpty) {
                            return "Username tidak boleh kosong";
                          }
                        },
                        onSaved: (e) => username = e,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.people),
                            labelText: "Username",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        obscureText: _secureText,
                        onSaved: (e) => password = e,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: showHide,
                              icon: Icon(_secureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                      ),
                      SizedBox(
                        height: 36.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.lightGreenAccent.shade100,
                          color: Colors.green,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 400.0,
                            height: 52.0,
                            onPressed: () {
                              check();
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );

        break;
      case LoginStatus.signIn:
        return Home(signOut);
        break;
    }
  }
}
