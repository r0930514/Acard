import 'package:flutter/material.dart';

final snackBar = new SnackBar(
  content: Text('這是活在中間的按鈕所發出的訊號'),
  action: SnackBarAction(
    label: '關閉',
    onPressed: () {},
  ),
);

class page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('第一頁'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('這是活在中間的按鈕'),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            )
          ],
        ),
      ),
    );
  }
}
