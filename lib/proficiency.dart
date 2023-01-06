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
      home: ProficiencyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProficiencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController Language = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['proficiencies']['languange']);
    TextEditingController OtherProficiencies = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['proficiencies']['other']);
    return Scaffold(
      appBar: AppBar(
        title: Text("Character Proficiency"),
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
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Language',
                    ),
                    textAlign: TextAlign.left,
                    controller: Language,
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
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      labelText: 'Other Proficiencies',
                    ),
                    textAlign: TextAlign.left,
                    controller: OtherProficiencies,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScopedModel.of<MainModel>(context).updateProficiency(
                kunci, Language.text,
                OtherProficiencies.text);
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        )
    );
  }
}
