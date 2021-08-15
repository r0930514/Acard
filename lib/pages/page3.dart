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
      body: ListWeatherWidget(futureJson: futureJson),
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
        if (snapshot.hasData) {
          return RefreshIndicator(
            onRefresh: () => futureJson,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('顯示' +
                        snapshot.data!.locations[0]['weatherElement'][1]['time']
                            [0]['startTime'] +
                        ' 的天氣狀態'),
                  ),
                ),
                Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.locations.length,
                    itemBuilder: (context, index) {
                      var weatherIcon = Icons.error;
                      var temp = snapshot.data!.locations[index];
                      switch (temp['weatherElement'][1]['time'][0]
                          ['elementValue'][0]['value']) {
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
                        case '短暫雨':
                          {
                            weatherIcon = Icons.grain;
                            break;
                          }
                        case '午後短暫雷陣雨':
                          {
                            weatherIcon = Icons.bolt;
                            break;
                          }
                        case '陰':
                          {
                            weatherIcon = Icons.wb_cloudy;
                            break;
                          }
                        default:
                          {
                            //print(snapshot.data!.weatherWx);
                            break;
                          }
                      }
                      return ListCard(weatherIcon: weatherIcon, temp: temp);
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.network_check),
              Text('網路連線失敗'),
            ],
          ));
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

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    required this.weatherIcon,
    required this.temp,
  }) : super(key: key);

  final IconData weatherIcon;
  final temp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            onTap: () {},
            leading: Icon(weatherIcon),
            title: Text(temp['locationName']),
            subtitle: Text('降雨機率' +
                temp['weatherElement'][0]['time'][0]['elementValue'][0]
                    ['value'] +
                '%'),
            trailing: Text(
              temp['weatherElement'][3]['time'][0]['elementValue'][0]['value'] +
                  '°C',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
