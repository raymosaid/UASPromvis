import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uaspromvisray/character.dart';
import 'package:uaspromvisray/main.dart';

class Addchar extends StatefulWidget {
  final Function(Character) addChar;
  Addchar(this.addChar);

  @override
  AddcharState createState() {
    return AddcharState();
  }
}

class AddcharState extends State<Addchar> {
  final textEditController = TextEditingController();
  String nama = "";
  String pilihanrace = "Human";
  String pilihanclass = "Warrior";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textEditController.dispose();
    super.dispose();
  }

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
                  controller: textEditController,
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
                        final character = Character(textEditController.text, pilihanrace, pilihanclass);
                        String json = jsonEncode(Character(textEditController.text, pilihanrace, pilihanclass));
                        //widget.addChar(character);
                      }); //refresh
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return MyApp();
                      }));
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            )), //affold
    ); //Material APP
  }
}
