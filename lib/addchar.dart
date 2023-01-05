import 'package:flutter/material.dart';
import 'dart:convert';
import 'ability.dart';
import 'dart:io';
import 'abilitychart.dart';
import 'package:scoped_model/scoped_model.dart';
import 'Main_Model.dart';
import 'package:uaspromvisray/main.dart';

void main() {
  runApp(ScopedModel(
    model: (MainModel()),
    child: Addchar(),
  )
  );
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

  String kunci = '';

  @override

  @override
  Widget build(BuildContext context) {
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
                  controller: nama,
                  ),
                ),

                Text('Select Race:'),
                DropdownButton(
                  value: pilihanrace,
                  items: <String>['Human', 'Elf', 'Dwarf'].map<DropdownMenuItem<String>>((String value){
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
                  items: <String>['Warrior', 'Mage'].map<DropdownMenuItem<String>>((String value){
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
                        ScopedModel.of<MainModel>(context).addAccount(kunci, nama.text, pilihanrace, pilihanclass);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        );
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
