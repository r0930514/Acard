import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '很棒的卡片',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      home: Myhomepage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Myhomepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首頁'),
      ),
      drawer: Drawer(
        child: ListView(children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(Icons.people),
                  backgroundColor: Colors.black38,
                ),
                SizedBox(height: 10),
                Text(
                  '這裡就用魚類色好了乁( ˙ ω˙乁)',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            decoration: BoxDecoration(color: Colors.green),
          ),
          ListTile(
            leading: Icon(Icons.book_outlined),
            title: Text('頁面跳轉'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page1()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text('關於'),
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationIcon: Icon(Icons.face),
                applicationVersion: 'v20210812-Alpha',
                children: [
                  Text('本應用程式為測試用途'),
                ],
              );
            },
          )
        ]),
      ),
      //首頁的卡片
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.looks_one),
                  title: Text('奇數偶數分辨器'),
                  subtitle: Text('已完成'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => page1()));
                  },
                  child: Text('跳轉至Page_1'),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.http),
                  title: Text('JsonPlaceHolder API 實驗'),
                  subtitle: Text('已完成'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => page2()));
                  },
                  child: Text('跳轉至Page_2'),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.cloud),
                  title: Text('天氣API 實驗'),
                  subtitle: Text('尚未完成'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => page3()));
                  },
                  child: Text('跳轉至Page_3'),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
