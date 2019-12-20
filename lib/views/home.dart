import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util.dart';
import 'formnilai.dart';

class Home extends StatefulWidget {
  final VoidCallback signOut;
  Home(this.signOut);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String nama = "";
  String foto = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString("nama");
      foto = preferences.getString("foto");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 30.0,
                child: ListTile(
                  leading: Image.network(
                    "http://${util.url}/c-sat/pages/images/$foto",
                    scale: 1.0,
                  ),
                  title: Text("$nama"),
                  subtitle: Text("Driver Support Unit"),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 200.0,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.green),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FormNilai(
                                    nama: nama,
                                    foto: foto,
                                  )));
                    },
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8.0),
                        Image.asset(
                          "assets/person.png",
                          height: 150.0,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text("Beri Kami Nilai",
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black))
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('$nama'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('http://${util.url}/c-sat/pages/images/$foto'),
              ),
              decoration: BoxDecoration(color: Colors.green),
              accountEmail: null,
            ),
            ListTile(
              onTap: () {
                signOut();
              },
              leading: Icon(Icons.exit_to_app),
              title: Text("Log Out"),
            )
          ],
        ),
      ),
    );
  }
}
