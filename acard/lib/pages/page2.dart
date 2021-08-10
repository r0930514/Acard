import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class page2 extends StatefulWidget {
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  List data = [];
  //資料獲取與解碼
  Future getData() async {
    var response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
    return "success";
  }

  //初始化
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二頁'),
      ),
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
