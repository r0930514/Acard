import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String displayText = '';

  //文字輸入框變數定義
  final TextEditingController textInput = new TextEditingController();
  final TextEditingController alertTextInput = new TextEditingController();

  //彈出輸入框
  void _showdialog() {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('想知道嗎！！乁( ˙ ω˙乁)'),
        content: TextField(
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
          keyboardType: TextInputType.number,
          controller: alertTextInput,
          decoration: InputDecoration(
            hintText: '請輸入數字',
            helperText: '請輸入正確的數字（0-100）',
          ),
        ),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(
              fontSize: 15,
            )),
            onPressed: () {
              alertBtnPress();
              Navigator.pop(context);
              alertTextInput.text = '';
              alertresult();
            },
            child: const Text('確認'),
          ),
          TextButton(
            style: TextButton.styleFrom(
                textStyle: const TextStyle(
              fontSize: 15,
            )),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('走開(｡•́︿•̀｡)'),
          )
        ],
      ),
    );
  }

  //結果彈出視窗
  void alertresult() => setState(() {
        showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('答案揭曉！！乁( ˙ ω˙乁) '),
            content: Text(displayText),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                  fontSize: 15,
                )),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('確認'),
              ),
            ],
          ),
        );
      });

  //結果顯示的文字
  void alertBtnPress() {
    FocusScope.of(context).requestFocus(FocusNode());
    int num = int.parse(alertTextInput.text);
    String temp = '';
    if (num < 100) {
      if (num == 64) {
        temp = '齁齁你乳滑';
      } else if (num % 2 == 0) {
        temp = '他是偶數:)';
      } else {
        temp = '他是奇數：(';
      }
      setState(() {
        displayText = temp;
      });
    } else {
      setState(() {
        displayText = '我剛剛不是叫你好好打數字了嗎（0-100）';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.green,
        //brightness: Brightness.dark,
        title: Text('奇數偶數分辨器'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                fontSize: 20,
              )),
              onPressed: _showdialog,
              child: const Text('有人想知道什麼數是奇數還是偶數嗎'),
            ),
          ],
        ),
      ),
    );
  }
}
