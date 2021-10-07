// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      theme: ThemeData(
          primaryColor: Colors.purple, accentColor: Colors.yellowAccent),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SilverAppBarWithTabBarScreen(),
    );
  }
}

class SilverAppBarWithTabBarScreen extends StatefulWidget {
  const SilverAppBarWithTabBarScreen({Key? key}) : super(key: key);

  @override
  _SilverAppBarWithTabBarState createState() => _SilverAppBarWithTabBarState();
}

class _SilverAppBarWithTabBarState extends State<SilverAppBarWithTabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.pink,
              height: 400.0,
            ),
          ),
          SliverAppBar(
            toolbarHeight: 0.0,
            collapsedHeight: 0.0,
            expandedHeight: 0.0,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          SliverFillRemaining(
            child: SizedBox(
              height: 400.0,
              child: TabBarView(
                controller: controller,
                children: [
                  Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.yellow,
                      height: 50.0,
                      child: Text('Text 1'),
                    ),
                  ]),
                  Column(children: [
                    Container(
                      width: double.infinity,
                      color: Colors.yellow,
                      height: 50.0,
                      child: Text('Text 2'),
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.green,
                      height: 50.0,
                      child: Text('Text 2'),
                    ),
                  ]),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.yellow,
                        height: 50.0,
                        child: Text('Text 3'),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.green,
                        height: 50.0,
                        child: Text('Text 3'),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.red,
                        height: 50.0,
                        child: Text('Text 3'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     color: Colors.pink,
          //     height: 400.0,
          //   ),
          // ),
          // SliverFillRemaining(),
        ],
      ),
    );
  }
}
