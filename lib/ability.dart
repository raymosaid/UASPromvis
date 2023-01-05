import 'package:uaspromvisray/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:uaspromvisray/basicStats.dart';
import 'package:uaspromvisray/personality.dart';
import 'package:uaspromvisray/equipment.dart';
import 'Main_Model.dart';
import 'dart:math' as math;
import 'package:uaspromvisray/main.dart';


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
      home: AbilityPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AbilityPage extends StatelessWidget {
  @override
  num max = 0;
  TextEditingController STR = TextEditingController();
  TextEditingController DEX = TextEditingController();
  TextEditingController CON = TextEditingController();
  TextEditingController INT = TextEditingController();
  TextEditingController WIS = TextEditingController();
  TextEditingController CHA = TextEditingController();
  TextEditingController Inspiration = TextEditingController();
  TextEditingController Proficiency = TextEditingController();
  TextEditingController Perception = TextEditingController();
  TextEditingController Saving = TextEditingController();
  TextEditingController Skills = TextEditingController();

  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(''),
                      maxRadius: 40,
                    ),
                    SizedBox(height: 10),
                    Text(ScopedModel.of<MainModel>(context).data[kunci]['name'],
                        style: TextStyle(fontSize: 15, color: Colors.white)
                    ),
                    Text(ScopedModel.of<MainModel>(context).data[kunci]['race'],
                        style: TextStyle(fontSize: 10, color: Colors.white)
                    ),
                    Text(ScopedModel.of<MainModel>(context).data[kunci]['class'],
                        style: TextStyle(fontSize: 10, color: Colors.white)
                    )
                  ],
                ),
              ),
              ListTile(
                title: Text("Dashboard"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Ability Scores"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AbilityPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Basic Stats'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BasicStatsPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Personality and Background'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalityPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Equipment'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EquipmentPage(),
                    ),
                  );
                },
              ),
              ListTile(
                  title: Text("Attacks and Spellcasting"),
                  onTap: (){Navigator.of(context).pushNamed("/");}
              ),
              ListTile(
                  title: Text("Character Features"),
                  onTap: (){Navigator.of(context).pushNamed("/");}
              ),
              ListTile(
                  title: Text("Character Proficiency"),
                  onTap: (){Navigator.of(context).pushNamed("/");}
              ),
              ListTile(
                  title: Text("Inventory"),
                  onTap: (){Navigator.of(context).pushNamed("/");}
              ),ListTile(
                  title: Text("Allies and Organizations"),
                  onTap: (){Navigator.of(context).pushNamed("/");}
              ),
              Container(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.logout),
                            title: Text('Log out'),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyHomePage(),
                                ),
                              );
                            },
                          )
                        ],
                      )
                  )
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
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
        max = math.max(math.max(double.parse(STR.text), double.parse(DEX.text)),math.max(math.max(double.parse(CON.text),double.parse(INT.text)), math.max(double.parse(WIS.text), double.parse(CHA.text))));
        ScopedModel.of<MainModel>(context).updateAbility(kunci,double.parse(STR.text), double.parse(DEX.text), double.parse(CON.text), double.parse(INT.text), double.parse(WIS.text), double.parse(CHA.text), max);
        },
      tooltip: 'Save',
      child: const Icon(Icons.add),

      )
    );
  }
}
