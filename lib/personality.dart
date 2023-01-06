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

  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController Personality = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['personality']['traits']);
    TextEditingController Ideals = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['personality']['ideals']);
    TextEditingController Bonds = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['personality']['bonds']);
    TextEditingController Flaws = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['personality']['flaws']);

    return Scaffold(
        appBar: AppBar(title: Text('Personality and Background')),

      body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
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
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
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
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
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
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScopedModel.of<MainModel>(context).updatePersonality(
              kunci,
              Personality.text,
              Ideals.text,
              Bonds.text,
              Flaws.text,
          );
        },
        tooltip: 'Save',
        child: const Icon(Icons.add),
      )
    );
  }
}