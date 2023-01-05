import 'package:flutter/material.dart';
import 'package:uaspromvisray/ability.dart';
import 'package:uaspromvisray/basicStats.dart';
import 'package:uaspromvisray/equipment.dart';
import 'package:uaspromvisray/dashboard.dart';


class PersonalityPage extends StatelessWidget {
  TextEditingController Personality = TextEditingController();
  TextEditingController Ideals = TextEditingController();
  TextEditingController Bonds = TextEditingController();
  TextEditingController Flaws = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Personality and Background')),

      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Personality Traits',
                    ),
                    textAlign: TextAlign.left,
                    controller: Personality,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Ideals',
                    ),
                    textAlign: TextAlign.left,
                    controller: Ideals,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Bonds',
                    ),
                    textAlign: TextAlign.left,
                    controller: Bonds,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Flaws',
                    ),
                    textAlign: TextAlign.left,
                    controller: Flaws,
                  ),
                ),
              ]),
            ),
          ]),

      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: const[
                  CircleAvatar(
                    backgroundImage: NetworkImage(''),
                    maxRadius: 40,
                  ),
                  SizedBox(height: 10),
                  Text('Character Name',
                      style: TextStyle(fontSize: 15, color: Colors.white)
                  ),
                  Text('Race',
                      style: TextStyle(fontSize: 10, color: Colors.white)
                  ),
                  Text('Level Class',
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
                title: Text("Character Proficiens"),
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
                            onTap: (){Navigator.of(context).pushNamed("/");}
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