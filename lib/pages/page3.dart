import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:acard/models/page3_weather.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

Future<WeatherJson> getJson() async {
  final response = await http.get(Uri.parse(
    'https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-069?Authorization=CWB-3055F66C-7B3F-47A8-8325-934D38EF2A4E',
  ));
  if (response.statusCode == 200) {
    return WeatherJson.fromJson(jsonDecode(response.body));
  } else {
    print(response.statusCode);
    throw Exception('Failed to load album');
  }
}

class _Page3State extends State<Page3> {
  late Future<WeatherJson> futureJson;
  //程式初始化
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListWeatherWidget(futureJson: futureJson),
        ],
      ),
    );
  }
}

class ListWeatherWidget extends StatelessWidget {
  const ListWeatherWidget({
    required this.futureJson,
  });

  final Future<WeatherJson> futureJson;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WeatherJson>(
      future: futureJson,
      builder: (context, snapshot) {
        var weatherIcon = Icons.error;
        if (snapshot.hasData) {
          print(snapshot.data!.locations[6]['locationName']);
          switch (snapshot.data!.weatherWx) {
            case '多雲':
              {
                weatherIcon = Icons.cloud;
                break;
              }
            case '晴':
              {
                weatherIcon = Icons.wb_sunny;
                break;
              }
            case '短暫陣雨':
              {
                weatherIcon = Icons.grain;
                break;
              }
            default:
              {
                //print(snapshot.data!.weatherWx);
                break;
              }
          }
          return Column(
            children: [
              ListTile(
                leading: Icon(weatherIcon),
                title: Text('新北市' +
                    snapshot.data!.name +
                    ' 現在' +
                    snapshot.data!.weatherWx),
                subtitle: Text('降雨機率' +
                    snapshot.data!.rainyValue +
                    '%、' +
                    '溫度' +
                    snapshot.data!.temperature +
                    '度'),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('網路連線失敗'));
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        );
      },
    );
  }
}
