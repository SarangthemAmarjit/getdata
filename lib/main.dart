import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getpostapp/jsonplaceholder.dart';
import 'package:getpostapp/modal.dart';
import 'package:getpostapp/newmodel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetPost',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: GetPostApp(),
    );
  }
}

class GetPostApp extends StatefulWidget {
  const GetPostApp({Key? key}) : super(key: key);

  @override
  State<GetPostApp> createState() => _GetPostAppState();
}

class _GetPostAppState extends State<GetPostApp> {
  List<JsonPlaceHolder> newlist = [];
  Future<List<JsonPlaceHolder>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/albums';
    var response = await http.get(Uri.parse(url));

    List<JsonPlaceHolder> datalist = [];
    if (response.statusCode == 200) {
      //final jsonok = "[" + response.body + "]";
      //List notesjson = json.decode(response.body);
      var notesjson1 = jsonDecode(response.body.toString());
      for (Map<String, dynamic> i in notesjson1) {
        datalist.add(JsonPlaceHolder.fromJson(i));
      }
    }
    return datalist;
  }

  @override
  Widget build(BuildContext context) {
    fetchData().then((value) {
      setState(() {
        newlist.addAll(value);
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("GetPost App"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, ind) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NAME :" + newlist[ind].id.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text("EMAIL :" + newlist[ind].title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: newlist.length,
      ),
    );
  }
}
