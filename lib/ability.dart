import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'dart:math' as math;
import 'drawer.dart';

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
      home: AbilityPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AbilityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    num max = 0;
    TextEditingController STR = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['str']
            .toString());
    TextEditingController DEX = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['dex']
            .toString());
    TextEditingController CON = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['con']
            .toString());
    TextEditingController INT = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['int']
            .toString());
    TextEditingController WIS = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['wis']
            .toString());
    TextEditingController CHA = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['cha']
            .toString());
    TextEditingController Inspiration = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['inspiration']
            .toString());
    TextEditingController Proficiency = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['proficiency']
            .toString());
    TextEditingController Perception = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['perception']
            .toString());
    TextEditingController Saving = TextEditingController(
        text: ScopedModel.of<MainModel>(context)
            .data[kunci]['abilityScores']['savingThrows']
            .toString());
    TextEditingController Skills = TextEditingController(
        text: ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']
            ['skills']);
    return Scaffold(
        appBar: AppBar(
          title: Text('Ability Scores'),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: myDrawer(),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'STR',
                      ),
                      textAlign: TextAlign.center,
                      controller: STR,
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'DEX',
                        ),
                        textAlign: TextAlign.center,
                        controller: DEX,
                      )),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CON',
                      ),
                      textAlign: TextAlign.center,
                      controller: CON,
                    ))
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'INT',
                    ),
                    textAlign: TextAlign.center,
                    controller: INT,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'WIS',
                      ),
                      textAlign: TextAlign.center,
                      controller: WIS,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CHA',
                      ),
                      textAlign: TextAlign.center,
                      controller: CHA,
                    )),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Inspiration',
                  ),
                  textAlign: TextAlign.center,
                  controller: Inspiration,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Proficiency Bonus',
                  ),
                  textAlign: TextAlign.center,
                  controller: Proficiency,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Perception',
                  ),
                  textAlign: TextAlign.center,
                  controller: Perception,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Saving Throws',
                  ),
                  textAlign: TextAlign.center,
                  controller: Saving,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Skills',
                  ),
                  textAlign: TextAlign.center,
                  controller: Skills,
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            max = math.max(
                math.max(double.parse(STR.text), double.parse(DEX.text)),
                math.max(
                    math.max(double.parse(CON.text), double.parse(INT.text)),
                    math.max(double.parse(WIS.text), double.parse(CHA.text))));
            ScopedModel.of<MainModel>(context).updateAbility(
                kunci,
                double.parse(STR.text),
                double.parse(DEX.text),
                double.parse(CON.text),
                double.parse(INT.text),
                double.parse(WIS.text),
                double.parse(CHA.text),
                max,
                double.parse(Inspiration.text),
                double.parse(Proficiency.text),
                double.parse(Perception.text),
                double.parse(Saving.text),
                Skills.text);
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        ));
  }
}
