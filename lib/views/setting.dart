import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        leading: Icon(Icons.settings),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: 40.0,),
                Text(
                  "Silakan Ubah Password",
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 24.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Passord Lama"),
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Passord Baru"),
                ),
                SizedBox(height: 16.0,),
                TextFormField(
                  obscureText: true,
                  decoration:
                      InputDecoration(hintText: "Konfirmasi Passord Baru"),
                ),
                SizedBox(height: 54.0,),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
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
