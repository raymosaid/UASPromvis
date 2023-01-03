import 'package:flutter/material.dart';
import 'package:uaspromvisray/character.dart';
import 'dart:convert';
import 'addchar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tubes Promvis',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Tubes Promvis'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Character> charlist = [];

  @override
  Widget build(BuildContext context) {
    void addCharData(Character character){
      setState(() {
        charlist.add(character);
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Addchar(addCharData);
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(itemBuilder: (context,index){
          return Card(
            margin: EdgeInsets.all(4),
            elevation: 8,
            child: ListTile(
              title: Text(charlist[index].name),
              subtitle: Text(charlist[index].race),
              trailing: Text(charlist[index].classs),
            ),
          );
        }, itemCount: charlist.length,),
      ),
    );
  }
}
