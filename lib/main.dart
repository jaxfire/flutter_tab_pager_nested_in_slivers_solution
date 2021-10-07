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

const List<String> data = [
  'Zeroth',
  'First',
];

const List<Tab> tabs = <Tab>[
  Tab(text: 'Zeroth'),
  Tab(text: 'First'),
];

// /// This is the stateless widget that the main application instantiates.
// class MyStatelessWidget extends StatefulWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
// }
//
// class _MyStatelessWidgetState extends State<MyStatelessWidget> {
//   int selectedTab = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: tabs.length,
//       // The Builder widget is used to have a different BuildContext to access
//       // closest DefaultTabController.
//       child: Builder(
//         builder: (BuildContext context) {
//           final TabController tabController = DefaultTabController.of(context)!;
//           tabController.addListener(() {
//             if (!tabController.indexIsChanging) {
//               setState(() {
//                 selectedTab = tabController.index;
//               });
//             }
//           });
//           return Scaffold(
//             appBar: AppBar(
//               bottom: const TabBar(
//                 tabs: tabs,
//               ),
//             ),
//             body: Center(
//               child: Text('stuff $selectedTab'),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

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
      // The Builder widget is used to have a different BuildContext to access
      // closest DefaultTabController.
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
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: MyTabBarView(selectedTab: selectedTab),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.pink,
                    height: 400.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyTabBarView extends StatelessWidget {
  final int selectedTab;

  const MyTabBarView({Key? key, required this.selectedTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> theWidgets = [MyThing()];
    if (selectedTab == 1) {
      theWidgets.add(MyThing());
    }
    return Column(
      children: theWidgets,
    );
  }
}

class MyThing extends StatelessWidget {
  const MyThing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.yellow,
      height: 50.0,
      child: Text('Text 1'),
    );
  }
}
