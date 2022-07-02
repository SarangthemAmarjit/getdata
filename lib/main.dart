import 'package:flutter/material.dart';
import 'package:getpostapp/newmodel.dart';
import 'package:getpostapp/serviceapi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetPost',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const GetPostApp(),
    );
  }
}

class GetPostApp extends StatefulWidget {
  const GetPostApp({Key? key}) : super(key: key);

  @override
  State<GetPostApp> createState() => _GetPostAppState();
}

class _GetPostAppState extends State<GetPostApp> {
  List<Attributes> newlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetPost App"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                ServiceApi().fetchData().then((value) {
                  setState(() {
                    newlist.addAll(value);
                  });
                });
              },
              child: const Text("Get Data")),
          ListView.builder(
            itemBuilder: (BuildContext context, ind) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "NAME :${newlist[ind].name}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("EMAIL :${newlist[ind].email}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(
                        "ADDRESS :${newlist[ind].address}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "NUMBER :${newlist[ind].number}",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
            shrinkWrap: true,
            itemCount: newlist.length,
          ),
        ],
      ),
    );
  }
}
