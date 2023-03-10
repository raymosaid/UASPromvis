import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
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
      home: BasicStatsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BasicStatsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();
    TextEditingController Armor = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["armor"].toString());
    TextEditingController Initiative = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["initiative"].toString());
    TextEditingController Speed = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["speed"].toString());
    TextEditingController Points = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["maxhp"].toString());
    TextEditingController HIT = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["hp"].toString());
    TextEditingController Temporary = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["temphp"].toString());
    TextEditingController Total = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["totalhitdice"].toString());
    TextEditingController Death = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]["basicStats"]["deathsaves"].toString());
    return Scaffold(
        appBar: AppBar(title: Text('Basic Stats')),
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                      labelText: 'Speed',
                    ),
                    textAlign: TextAlign.center,
                    controller: Speed,
                  )),
            ]),
          ),
          Padding(
            padding: EdgeInsets.all(2),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.92,
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Total HIT Dice',
                      ),
                      textAlign: TextAlign.center,
                      controller: Total,
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Death Saves',
                        ),
                        textAlign: TextAlign.center,
                        controller: Death,
                      )),
                ]),
          ),
        ]),
        drawer: myDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScopedModel.of<MainModel>(context).updateBasicStats(
                kunci,
                num.parse(Armor.text),
                num.parse(Initiative.text),
                num.parse(Speed.text),
                num.parse(Points.text),
                num.parse(HIT.text),
                num.parse(Temporary.text),
                num.parse(Total.text),
                num.parse(Death.text)
            );
          },
          tooltip: 'Save',
          child: const Icon(Icons.add),
        )
    );
  }
}
