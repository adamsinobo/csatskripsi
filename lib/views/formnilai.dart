import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../util.dart';

class FormNilai extends StatefulWidget {
  final String nama;
  final String foto;

  const FormNilai({Key key, this.nama, this.foto}) : super(key: key);
  @override
  _FormNilaiState createState() => _FormNilaiState();
}

class _FormNilaiState extends State<FormNilai> {
  String nama, koment;
  int nilai;
  final _key = new GlobalKey<FormState>();


  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
    }
  }

  save() async {
    final response = await http
        .post("http://${util.url}/c-sat/api/postfeedback.php", 
        body: {
      "nama": widget.nama,
      "nilai": klik.toString(),
      "koment": koment != null ? koment : '',
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(pesan);
    }
  }

  String namaa = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      namaa = preferences.getString("nama");
    });
  }
  
  @override
  void initState() {
    super.initState();
    getPref();
  }

  var klik = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Nilai"),
      ),
      body: Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Image.network("http://${util.url}/c-sat/pages/images/${widget.foto}", height: 100.0,),
                  Text(
                    "${widget.nama}",
                    style: TextStyle(fontSize: 30.0), textAlign: TextAlign.center,
                  ),
                  Text(
                    "Driver Support Unit",
                    style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      color: klik == 1 ? Colors.blueAccent[100] : Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            klik = 1;
                          });
                        },
                        child: Image.asset(
                          "assets/icon-puas.png",
                          height: 120.0,
                        ),
                      ),
                    ),
                    Container(
                      height: 120.0,
                      color: klik == 2 ? Colors.blueAccent[100] : Colors.white,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            klik = 2;
                          });
                        },
                        child: Image.asset(
                          "assets/icon-tidak-puas.png",
                          height: 120.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 100.0,
                    child: TextFormField(
                      onChanged: (e) => koment = e,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Masukan Komentar"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightGreenAccent.shade100,
                    color: Colors.green,
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 320.0,
                      height: 52.0,
                      onPressed: () {
                        // check();
                        save();
                      },
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
