import 'package:flutter/material.dart';
import 'package:uaspromvisray/ability.dart';
import 'package:uaspromvisray/equipment.dart';
import 'package:uaspromvisray/dashboard.dart';
import 'package:uaspromvisray/personality.dart';

class BasicStatsPage extends StatelessWidget {
  TextEditingController Armor = TextEditingController();
  TextEditingController Initiative = TextEditingController();
  TextEditingController Speed = TextEditingController();
  TextEditingController Points = TextEditingController();
  TextEditingController HIT = TextEditingController();
  TextEditingController Temporary = TextEditingController();
  TextEditingController Total = TextEditingController();
  TextEditingController Death = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Basic Stats')),

      body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(75),
                      labelText: 'Armor Class',
                    ),
                    textAlign: TextAlign.center,
                    controller: Armor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(75),
                        labelText: 'Initiative',
                      ),
                      textAlign: TextAlign.center,
                      controller: Initiative,
                    ),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(75),
                        labelText: 'Speed',
                      ),
                      textAlign: TextAlign.center,
                      controller: Speed,
                    )
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Maximum HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: Points,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(20),
                      labelText: 'Current HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: HIT,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.92,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(60),
                      labelText: 'Temporary HIT Points',
                    ),
                    textAlign: TextAlign.center,
                    controller: Temporary,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(90),
                      labelText: 'Total HIT Dice',
                    ),
                    textAlign: TextAlign.center,
                    controller: Total,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(90),
                        labelText: 'Death Saves',
                      ),
                      textAlign: TextAlign.center,
                      controller: Death,
                    )
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