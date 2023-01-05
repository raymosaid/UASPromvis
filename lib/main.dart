import 'package:flutter/material.dart';
import 'package:uaspromvisray/Main_Model.dart';
import 'addchar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: MainModel(),
        child: MaterialApp(
          title: "Tubes PromVis",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    int kunci = ScopedModel.of<MainModel>(context).getNumberOfAccounts();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Addchar(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Text("Tubes PromVis"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (kunci == null) return Container();
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                title: Text(
                    ScopedModel.of<MainModel>(context).data[kunci.toString()[index]]['name']),
                subtitle: Text(
                    ScopedModel.of<MainModel>(context).data[kunci.toString()[index]]['race']),
                trailing: Text(
                    ScopedModel.of<MainModel>(context).data[kunci.toString()[index]]['class']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
              ),
            );
          },
          itemCount: kunci,
        ),
      ),
    );
  }
}
