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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        // The number of tabs / content sections to display.
        length: 3,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: Colors.pink,
                height: 400.0,
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 400.0,
                child: TabBarView(
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
            SliverToBoxAdapter(
              child: Container(
                color: Colors.pink,
                height: 400.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
