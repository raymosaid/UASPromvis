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
      home: FeaturePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FeaturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController Age = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['features']['age']
            .toString());
    TextEditingController Height = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['features']['height']
            .toString());
    TextEditingController Weight = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['features']['weight']
            .toString());
    TextEditingController Eyes = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['features']
            ['eyes']);
    TextEditingController Skin = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['features']
            ['skin']);
    TextEditingController Hair = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['features']
            ['hair']);
    TextEditingController AdditionalTraits = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['features']
            ['additional']);
    TextEditingController CharacterBackstory = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['features']
            ['backstory']);
    return Scaffold(
        appBar: AppBar(
          title: Text("Character Features"),
        ),
        drawer: myDrawer(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Age"),
                      textAlign: TextAlign.center,
                      controller: Age,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5),
                            labelText: "Height"),
                        textAlign: TextAlign.center,
                        controller: Height,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5),
                            labelText: "Weight"),
                        textAlign: TextAlign.center,
                        controller: Weight,
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Eyes"),
                      textAlign: TextAlign.center,
                      controller: Eyes,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(5),
                            labelText: "Skin"),
                        textAlign: TextAlign.center,
                        controller: Skin,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(5),
                          labelText: "Hair"),
                      textAlign: TextAlign.center,
                      controller: Hair,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      maxLines: 10,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(20),
                        labelText: 'Additional Traits',
                      ),
                      textAlign: TextAlign.left,
                      controller: AdditionalTraits,
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
                        contentPadding: EdgeInsets.all(20),
                        labelText: 'Character Backstory',
                      ),
                      textAlign: TextAlign.left,
                      controller: CharacterBackstory,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScopedModel.of<MainModel>(context).updateFeatures(
                kunci,
                double.parse(Age.text),
                double.parse(Height.text),
                double.parse(Weight.text),
                Eyes.text,
                Skin.text,
                Hair.text,
                AdditionalTraits.text,
                CharacterBackstory.text);
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        )
    );
  }
}
