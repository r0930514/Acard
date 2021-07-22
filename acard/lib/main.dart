import 'package:flutter/material.dart';
import 'pages/page1.dart';
// ignore: unused_import
import 'package:http/http.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

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

final snackBar = new SnackBar(
  content: Text('Text'),
  action: SnackBarAction(
    label: '關閉',
    onPressed: () {},
  ),
);

void dialog() => {};

class Myhomepage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('這是白色的程式'),
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
            leading: Icon(Icons.light),
            title: Text('揭曉答案'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('答案揭曉！！乁( ˙ ω˙乁) '),
                  content: Text('今天天氣還不錯嘛'),
                  actions: [
                    TextButton(
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                        fontSize: 15,
                      )),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('確認'),
                    ),
                  ],
                ),
              );
            },
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
                applicationVersion: 'Alpha 1.0',
                children: [
                  Text('本應用程式為測試用途'),
                  Text('實際上可能連Alpha都沒有'),
                  Text('因為我根本就不知道這個APP要幹嘛')
                ],
              );
            },
          )
        ]),
      ),
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
                  leading: Icon(Icons.device_hub),
                  title: Text('卡片式排列'),
                  subtitle: Text('這是一個測試'),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: Text('測試鍵'),
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
                  leading: Icon(Icons.question_answer_outlined),
                  title: Text('這邊我不知道要幹嘛(｡•́︿•̀｡)'),
                  subtitle: Text('這也是一個測試'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('沒有任何作用的按鈕'),
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
