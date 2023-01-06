import 'package:flutter/material.dart';
import 'package:uaspromvisray/ability.dart';
import 'package:uaspromvisray/basicStats.dart';
import 'package:uaspromvisray/equipment.dart';
import 'package:uaspromvisray/main.dart';
import 'package:uaspromvisray/personality.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'package:uaspromvisray/dashboard.dart';


class myDrawer extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/profile2test.png'),
                  maxRadius: 40,
                ),
                SizedBox(height: 10),
                Text(ScopedModel
                    .of<MainModel>(context)
                    .data[kunci]['name'],
                    style: TextStyle(fontSize: 15, color: Colors.white)
                ),
                Text(ScopedModel
                    .of<MainModel>(context)
                    .data[kunci]['race'],
                    style: TextStyle(fontSize: 10, color: Colors.white)
                ),
                Text(ScopedModel
                    .of<MainModel>(context)
                    .data[kunci]['class'],
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
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }
          ),
          ListTile(
              title: Text("Character Features"),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }
          ),
          ListTile(
              title: Text("Character Proficiency"),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }
          ),
          ListTile(
              title: Text("Inventory"),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }
          ), ListTile(
              title: Text("Allies and Organizations"),
              onTap: () {
                Navigator.of(context).pushNamed("/");
              }
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
                        onTap: () {
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
    );
  }
  }