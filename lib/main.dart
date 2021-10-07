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
      home: MyStatelessWidget(),
    );
  }
}

const List<String> data = [
  'Zeroth',
  'First',
  'Second',
];

const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
  Tab(text: 'Second'),
];

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            setState(() {
              selectedTab = tabController.index;
            });
          }
        });
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: Center(
            child: Text('stuff $selectedTab'),
          ),
        );
      }),
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
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Tab 1'),
                  Tab(text: 'Tab 2'),
                  Tab(text: 'Tab 3'),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox.expand(
                child: Expanded(
                  child: MyTabBarView(),
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

class MyTabBarView extends StatelessWidget {
  const MyTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
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
    );
  }
}
