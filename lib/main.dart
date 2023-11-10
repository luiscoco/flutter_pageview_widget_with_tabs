import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TabBarView Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Page 1'),
            Tab(text: 'Page 2'),
            Tab(text: 'Page 3'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VerticalScrollPage(title: 'Page 1'),
          VerticalScrollPage(title: 'Page 2'),
          VerticalScrollPage(title: 'Page 3'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class VerticalScrollPage extends StatelessWidget {
  final String title;

  VerticalScrollPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$title Item $index'),
        );
      },
    );
  }
}
