import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/*
 * 列表拖动 使用于少量列表拖动
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _data = [
    Colors.blue,
    Colors.pinkAccent,
    Colors.deepPurple,
    Colors.orangeAccent
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new ReorderableListView(
          header: Container(
            height: 50,
          ),
          children: _data
              .map((s) => Card(
                    color: s,
                    key: Key(s.toString()),
                    child: Container(
                      width: 300,
                      height: 100,
                    ),
                  ))
              .toList(),
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var temp = _data.removeAt(oldIndex);
              _data.insert(newIndex, temp);
            });
            print("$oldIndex ====== $newIndex");
          },
        ));
  }
}
