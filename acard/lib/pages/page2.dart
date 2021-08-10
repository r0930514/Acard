import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class page2 extends StatefulWidget {
  @override
  _page2State createState() => _page2State();
}

class _page2State extends State<page2> {
  //資料獲取與解碼
  final String host =
      'https://ptx.transportdata.tw/MOTC/v2/Bus/RealTimeNearStop/City/Taipei?$format=json';
  static get format => null;
  //getData Funtion
  Future getData() async {
    return await http.get(Uri.parse(host)); // http 0.13 後不能直接輸入 string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第二頁'),
      ),
      body: FutureBuilder(
        future: getData(), // 執行 http
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // snapshot 抓資料，若有資料則:
          if (snapshot.hasData) {
            // jsonDecode 解壓
            List datas = jsonDecode(snapshot.data.body);
            //print(datas);
            return ListView.builder(
                itemCount: datas.length,
                itemBuilder: (context, idx) {
                  var data = datas[idx];
                  print(data);
                  return ListTile(
                    title: Text(data['PlateNumb']),
                    subtitle: Text(data['GPSTime']),
                  );
                });
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Container(); // 失敗回傳空資料
          } else {
            print('Awaiting result...');
            return Container();
          }
        },
      ),
    );
  }
}
