import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewBuilder 實作'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 150,
                child: Center(
                  child: Text('$index'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
