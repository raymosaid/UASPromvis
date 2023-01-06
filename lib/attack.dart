import 'package:uaspromvisray/drawer.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';

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
      home: AttackPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AttackPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    TextEditingController AttackStats = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['attacks']);

    return Scaffold(
      appBar: AppBar(
        title: Text("Attacks and Spellcastings"),
      ),
      drawer: myDrawer(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: TextField(
            maxLines: 100,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
              labelText: "Attacks"
            ),
            textAlign: TextAlign.left,
            controller: AttackStats,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScopedModel.of<MainModel>(context).updateAttacks(
              kunci, AttackStats.text
          );
        },
        tooltip: 'Save',
        child: const Icon(Icons.add),
      )
    );
  }
}
