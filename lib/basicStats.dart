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
      home: BasicStatsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasicStatsPage extends StatelessWidget {
  TextEditingController Armor = TextEditingController();
  TextEditingController Initiative = TextEditingController();
  TextEditingController Speed = TextEditingController();
  TextEditingController Points = TextEditingController();
  TextEditingController HIT = TextEditingController();
  TextEditingController Temporary = TextEditingController();
  TextEditingController Total = TextEditingController();
  TextEditingController Death = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    return Scaffold(
      appBar: AppBar(title: Text('Basic Stats')),

      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(75),
                      labelText: 'Armor Class',
                    ),
                    textAlign: TextAlign.center,
                    controller: Armor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(75),
                        labelText: 'Initiative',
                      ),
                      textAlign: TextAlign.center,
                      controller: Initiative,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(75),
                        labelText: 'Speed',
                      ),
                      textAlign: TextAlign.center,
                      controller: Speed,
                    )
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Maximum HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: Points,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Current HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: HIT,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Temporary HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: Temporary,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(90),
                      labelText: 'Total HIT Dice',
                    ),
                    textAlign: TextAlign.center,
                    controller: Total,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(90),
                        labelText: 'Death Saves',
                      ),
                      textAlign: TextAlign.center,
                      controller: Death,
                    )
                ),
              ]),
            ),
          ]),

      drawer: myDrawer(),
    );
  }
}