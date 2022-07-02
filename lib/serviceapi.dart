import 'dart:convert';
import 'package:getpostapp/newmodel.dart';
import 'package:http/http.dart' as http;

class ServiceApi {
  Future<List<Attributes>> fetchData() async {
    var url = 'https://herokunew123.herokuapp.com/api/application-forms';
    var response = await http.get(Uri.parse(url));

    List<Attributes> datalist = [];
    if (response.statusCode == 200) {
      //final jsonok = "[" + response.body + "]";
      //List notesjson = json.decode(response.body);
      var notesjson1 = jsonDecode(response.body.toString());
      for (Map<String, dynamic> i in notesjson1) {
        datalist.add(Attributes.fromJson(i));
      }
    }
    return datalist;
  }
}
