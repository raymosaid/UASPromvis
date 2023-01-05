import 'package:flutter/material.dart';
import 'package:uaspromvisray/ability.dart';
import 'package:uaspromvisray/basicStats.dart';
import 'package:uaspromvisray/equipment.dart';
import 'package:uaspromvisray/main.dart';
import 'package:uaspromvisray/personality.dart';
import 'package:uaspromvisray/abilitychart.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: MainModel(),
        child: MaterialApp(
            home: Dashboard(),
            debugShowCheckedModeBanner: false
        )
    );
  }
}

class Dashboard extends StatelessWidget {


  @override
  final profile = File('images/profile2test.png');

  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    return Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
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
        body: Center(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: 100,
                width: 100,
                child: Image.file(profile),
              ),
              Container(
                width: 300,
                height: 50,
                child: Center(
                  child: Text(
                    ScopedModel.of<MainModel>(context).data[kunci]['name'],
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ScopedModel.of<MainModel>(context).data[kunci]['race'],
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    ScopedModel.of<MainModel>(context).data[kunci]['class'],
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Container(
                  width: 300,
                  height: 300,
                  child: RadarChart(ticks: [
                    ScopedModel.of<MainModel>(context).getMaxTick(kunci)
                  ], features: [
                    "STR",
                    "DEX",
                    "CON",
                    "INT",
                    "WIS",
                    "CHA"
                  ], data: [
                    [
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['str'],
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['dex'],
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['con'],
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['int'],
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['wis'],
                      ScopedModel.of<MainModel>(context).data[kunci]['abilityScores']['cha']
                    ]
                  ])
              )
            ],
          ),
        )
    );
  }
}
