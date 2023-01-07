import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'package:uaspromvisray/main.dart';

void main() {
  runApp(ScopedModel(
    model: (MainModel()),
    child: Addchar(),
  ));
}

class Addchar extends StatefulWidget {
  @override
  AddcharState createState() {
    return AddcharState();
  }
}

class AddcharState extends State<Addchar> {
  TextEditingController nama = TextEditingController();
  String pilihanrace = "Human";
  String pilihanclass = "Warrior";

  @override
  @override
  Widget build(BuildContext context) {
    List<String> daftar = ScopedModel.of<MainModel>(context).getDaftarAkun();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Character'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Enter Name:'),
          SizedBox(
            width: 300,
            child: TextField(
              textAlign: TextAlign.center,
              controller: nama,
            ),
          ),
          Text('Select Race:'),
          DropdownButton(
            value: pilihanrace,
            items: <String>['Human', 'Elf', 'Dwarf']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                if (newValue != null) {
                  pilihanrace = newValue;
                }
              });
            },
          ),
          Text('Select Class:'),
          DropdownButton(
            value: pilihanclass,
            items: <String>['Warrior', 'Mage']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                if (newValue != null) {
                  pilihanclass = newValue;
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(20), //20 pixel ke semua arah
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  if (daftar.contains(nama.text)) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text("Name already exist!"),
                            actions: <Widget>[
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ),
                                    );
                                  },
                                  child: Text("ok"))
                            ],
                          );
                        });
                  }else {
                    ScopedModel.of<MainModel>(context)
                        .addAccount(nama.text, pilihanrace, pilihanclass);
                    ScopedModel.of<MainModel>(context)
                        .updateDaftarAkun(nama.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                      ),
                    );
                  }
                }); //refresh
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      )),
    ); //Material APP
  }
}
