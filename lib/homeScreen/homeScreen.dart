import 'package:flutter/material.dart';
import 'package:wuyiyit/allUsersList.dart';
import 'package:wuyiyit/messageScreen/conversationScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

const List<Tab> tabs = <Tab>[
  Tab(
    text: 'All',
    icon: Icon(Icons.all_inclusive_outlined),
  ),
  Tab(
    text: 'Private',
    icon: Icon(Icons.privacy_tip_rounded),
  ),
  Tab(
    text: 'Group',
    icon: Icon(Icons.group),
  ),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AllUsersList()));
            },
            backgroundColor: Colors.grey[800],
          ),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey[800],
            iconTheme: IconThemeData(
              color: Colors.grey[800],
            ),
            title: Text(
              'ውይይት',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.0,
                color: Colors.black,
              ),
            ),
            bottom: const TabBar(
              tabs: tabs,
              indicatorColor: Colors.orange,
              labelColor: Colors.black,
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: tabs.map((Tab tab) {
              return ConversationScreen();
            }).toList(),
          ),
        );
      }),
    );
  }
}
