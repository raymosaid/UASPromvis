import 'package:uaspromvisray/main.dart';
import 'package:flutter/material.dart';
import 'package:uaspromvisray/ability.dart';
import 'package:uaspromvisray/basicStats.dart';
import 'package:uaspromvisray/personality.dart';
import 'package:uaspromvisray/dashboard.dart';
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
      home: EquipmentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EquipmentPage extends StatelessWidget {
  TextEditingController CP = TextEditingController();
  TextEditingController SP = TextEditingController();
  TextEditingController EP = TextEditingController();
  TextEditingController GP = TextEditingController();
  TextEditingController PP = TextEditingController();
  TextEditingController Equipment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    return Scaffold(
      appBar: AppBar(title: Text('Equipment')),

      body: Row(
          children: [
      Padding(
      padding: EdgeInsets.all(70),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(20),
              labelText: 'CP',
            ),
            textAlign: TextAlign.center,
            controller: CP,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20),
                labelText: 'SP',
              ),
              textAlign: TextAlign.center,
              controller: SP,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20),
                labelText: 'EP',
              ),
              textAlign: TextAlign.center,
              controller: EP,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20),
                labelText: 'GP',
              ),
              textAlign: TextAlign.center,
              controller: GP,
            ),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.1,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(20),
                labelText: 'PP',
              ),
              textAlign: TextAlign.center,
              controller: PP,
            )
        ),
      ]),
    ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(300),
                    labelText: 'Equipment',
                  ),
                  textAlign: TextAlign.center,
                  controller: Equipment,
                )
            ),
          ]),


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
    );
  }
}