// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Tab 1'),
  Tab(text: 'Tab 2'),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                selectedTab = tabController.index;
              });
            }
          });
          return Scaffold(
            body: CustomScrollView(
              slivers: <Widget>[
                AnyOldSliverWidget(colour: Colors.tealAccent),
                AnyOldSliverWidget(colour: Colors.blue),
                AnyOldSliverWidget(colour: Colors.green),
                SliverToBoxAdapter(
                  child: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    tabs: tabs,
                  ),
                ),
                SliverToBoxAdapter(
                  child: MyTabBarView(selectedTab: selectedTab),
                ),
                AnyOldSliverWidget(colour: Colors.red),
                AnyOldSliverWidget(colour: Colors.orange),
                AnyOldSliverWidget(colour: Colors.blue),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AnyOldSliverWidget extends StatelessWidget {
  final Color colour;
  const AnyOldSliverWidget({Key? key, required this.colour}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: colour,
        height: 150.0,
        child: const Center(
          child: Text('I AM A SLIVER'),
        ),
      ),
    );
  }
}

class MyTabBarView extends StatelessWidget {
  final int selectedTab;

  const MyTabBarView({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      height: (selectedTab == 0) ? 100.0 : 200.0,
      child: const Center(
        child: Text('MY HEIGHT IS DYNAMIC'),
      ),
    );
  }
}
