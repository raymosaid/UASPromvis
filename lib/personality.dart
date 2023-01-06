import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'drawer.dart';


void main() {
  runApp(ScopedModel(
    model: MainModel(),
    child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PersonalityPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PersonalityPage extends StatelessWidget {
  TextEditingController Personality = TextEditingController();
  TextEditingController Ideals = TextEditingController();
  TextEditingController Bonds = TextEditingController();
  TextEditingController Flaws = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    return Scaffold(
        appBar: AppBar(title: Text('Personality and Background')),

      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Personality Traits',
                    ),
                    textAlign: TextAlign.left,
                    controller: Personality,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Ideals',
                    ),
                    textAlign: TextAlign.left,
                    controller: Ideals,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Bonds',
                    ),
                    textAlign: TextAlign.left,
                    controller: Bonds,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Flaws',
                    ),
                    textAlign: TextAlign.left,
                    controller: Flaws,
                  ),
                ),
              ]),
            ),
          ]),

      drawer: myDrawer(),
    );
  }
}