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

  @override
  Widget build(BuildContext context) {

    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController Inventory = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['inventory']['inv']);
    TextEditingController Treasure = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['inventory']['treasure']);
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventory"),
      ),
      drawer: myDrawer(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Inventory',
                    ),
                    textAlign: TextAlign.left,
                    controller: Inventory,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Treasures',
                    ),
                    textAlign: TextAlign.left,
                    controller: Treasure,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScopedModel.of<MainModel>(context).updateInventory(
                kunci,Inventory.text,
                Treasure.text);
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        )
    );
  }
}
