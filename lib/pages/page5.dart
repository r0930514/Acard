import 'package:flutter/material.dart';
import 'package:acard/models/page5_WuhanVirus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<WuhanVirus> getJson() async {
  final url = 'https://coronavirus-tracker-api.herokuapp.com/v2/locations';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print(WuhanVirus.fromJson(jsonDecode(response.body)));
    return WuhanVirus.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class Page5 extends StatefulWidget {
  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  late Future<WuhanVirus> futureJson;
  void initState() {
    super.initState();
    futureJson = getJson();
    //print(futureJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('武漢肺炎台灣確診資訊'),
      ),
      body: FutureBuilder<WuhanVirus>(
        future: futureJson,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text('data'));
          } else if (snapshot.hasError) {
            Center(
              child: Text('data'),
            );
          }
          return Center(
            child: Text('Error'),
          );
        },
      ),
    );
  }
}
