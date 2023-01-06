import 'package:uaspromvisray/drawer.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';

void main() {
  runApp(ScopedModel(
    model: MainModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InventoryPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InventoryPage extends StatelessWidget {
  TextEditingController Inventory = TextEditingController();
  TextEditingController Treasure = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
      ),
      drawer: myDrawer(),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Inventory',
                  ),
                  textAlign: TextAlign.left,
                  controller: Inventory,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                    labelText: 'Treasure',
                  ),
                  textAlign: TextAlign.left,
                  controller: Treasure,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
