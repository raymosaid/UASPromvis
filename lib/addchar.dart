import 'package:flutter/material.dart';
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

  @override

  @override
  Widget build(BuildContext context) {
    int kunci = ScopedModel.of<MainModel>(context).getNumberOfAccounts();
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
                        kunci = ScopedModel.of<MainModel>(context).getNumberOfAccounts() + 1;
                        ScopedModel.of<MainModel>(context).updateNumberOfAcc(kunci);
                        ScopedModel.of<MainModel>(context).addAccount(kunci.toString(), nama.text, pilihanrace, pilihanclass);
                        ScopedModel.of<MainModel>(context).updateDaftarAkun(kunci.toString());
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
