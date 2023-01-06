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
      home: AlliesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AlliesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController Allies = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['allies']);

    return Scaffold(
      appBar: AppBar(
        title: Text("Allies"),
      ),
      drawer: myDrawer(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              maxLines: 100,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(10),
              labelText: 'Allies',
            ),
            textAlign: TextAlign.left,
            controller: Allies,
          ),
          )
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScopedModel.of<MainModel>(context).updateAllies(
                kunci,Allies.text);
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        )
    );
  }
}
