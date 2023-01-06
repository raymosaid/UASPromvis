import 'package:flutter/material.dart';
import 'package:uaspromvisray/abilitychart.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'drawer.dart';

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
        drawer: myDrawer(),
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
