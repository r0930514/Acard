import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

Future<WeatherJson> getJson() async {
  final response = await http.get(Uri.parse(
    'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-061?Authorization=CWB-3055F66C-7B3F-47A8-8325-934D38EF2A4E',
  ));
  if (response.statusCode == 200) {
    return WeatherJson.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class WeatherJson {
  final String name;
  final String rainyValue;
  final String temperature;

  WeatherJson({
    required this.name,
    required this.rainyValue,
    required this.temperature,
  });
  factory WeatherJson.fromJson(Map<String, dynamic> weatherJsonData) {
    return WeatherJson(
        name: weatherJsonData['records']['locations'][0]['location'][4]
            ['locationName'],
        rainyValue: weatherJsonData['records']['locations'][0]['location'][4]
            ['weatherElement'][0]['time'][0]['elementValue'][0]['value'],
        temperature: weatherJsonData['records']['locations'][0]['location'][4]
            ['weatherElement'][3]['time'][0]['elementValue'][0]['value']);
  }
}

class _Page3State extends State<Page3> {
  late Future<WeatherJson> futureJson;
  void initState() {
    super.initState();
    futureJson = getJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天氣API 實驗'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('重新整理'),
          ),
          FutureBuilder<WeatherJson>(
            future: futureJson,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text('臺北市' + snapshot.data!.name + ' 天氣狀況'),
                  subtitle: Text('降雨機率' +
                      snapshot.data!.rainyValue +
                      '%、' +
                      '溫度' +
                      snapshot.data!.temperature +
                      '度'),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
