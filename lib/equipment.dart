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
      home: EquipmentPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EquipmentPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    String kunci = ScopedModel.of<MainModel>(context).getChosenAcc().toString();

    TextEditingController CP = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['equipment']['cp'].toString());
    TextEditingController SP = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['equipment']['sp'].toString());
    TextEditingController EP = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['equipment']['ep'].toString());
    TextEditingController GP = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['equipment']['gp'].toString());
    TextEditingController PP = TextEditingController(text: ScopedModel.of<MainModel>(context).data[kunci]['equipment']['pp'].toString());
    TextEditingController Equipment = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Equipment')),
      body: Row(children: [
        Padding(
          padding: EdgeInsets.all(70),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                    )),
              ]),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              maxLines: 80,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(10),
                labelText: 'Equipment',
              ),
              textAlign: TextAlign.left,
              controller: Equipment,
            ),
          ),
        ),
      ]),
      drawer: myDrawer(),
    );
  }
}
