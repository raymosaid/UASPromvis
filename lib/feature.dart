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
  TextEditingController Age = TextEditingController();
  TextEditingController Height = TextEditingController();
  TextEditingController Weight = TextEditingController();
  TextEditingController Eyes = TextEditingController();
  TextEditingController Skin = TextEditingController();
  TextEditingController Hair = TextEditingController();
  TextEditingController AdditionalTraits = TextEditingController();
  TextEditingController CharacterBackstory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Character Features"),
        ),
        drawer: myDrawer(),
        body: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(
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
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(
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
                        contentPadding: EdgeInsets.all(10),
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
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
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
        )));
  }
}
