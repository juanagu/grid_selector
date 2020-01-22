import 'package:flutter/material.dart';
import 'package:grid_selector/base_grid_selector_item.dart';
import 'package:grid_selector/grid_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GridSelector Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid selector sample"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: <Widget>[
                GridSelector<int>(
                  title: "Tail",
                  items: _getTails(),
                  onSelectionChanged: (option) => print(option),
                ),
                _buildDivider(),
                GridSelector<int>(
                  title: "Tail",
                  items: _getTails(),
                  onSelectionChanged: (option) => print(option),
                  itemSize: 80,
                ),
                _buildDivider(),
                GridSelector<int>(
                  title: "Tail",
                  items: [],
                  onSelectionChanged: (option) => print(option),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32.0,
      ),
      child: Divider(
        height: 2,
        color: Colors.grey,
      ),
    );
  }

  List<BaseGridSelectorItem> _getTails() {
    return [
      BaseGridSelectorItem(key: 1, label: "28"),
      BaseGridSelectorItem(key: 2, label: "29"),
      BaseGridSelectorItem(key: 3, label: "30"),
      BaseGridSelectorItem(key: 4, label: "31"),
      BaseGridSelectorItem(key: 5, label: "32", isEnabled: false),
      BaseGridSelectorItem(key: 6, label: "33"),
      BaseGridSelectorItem(key: 7, label: "34"),
      BaseGridSelectorItem(key: 8, label: "35", isEnabled: false),
      BaseGridSelectorItem(key: 9, label: "36"),
      BaseGridSelectorItem(key: 10, label: "37"),
      BaseGridSelectorItem(key: 11, label: "38"),
      BaseGridSelectorItem(key: 12, label: "39", isEnabled: false),
      BaseGridSelectorItem(key: 13, label: "40"),
      BaseGridSelectorItem(key: 14, label: "41"),
      BaseGridSelectorItem(key: 15, label: "42"),
      BaseGridSelectorItem(key: 16, label: "43"),
    ];
  }
}

