import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nuserver/constants/gaps.dart';
import 'package:nuserver/constants/sizes.dart';

class TrackingScreen extends StatelessWidget {
  final tabs = ['배송', '알림', '결제'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          //elevation: 1,
          title: const Text("서버"),
          actions: [
            IconButton(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size32,
              ),
              onPressed: () {},
              icon: const FaIcon(
                FontAwesomeIcons.bell,
              ),
            )
          ],
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [for (var tab in tabs) Tab(text: tab)],
          ),
        ),
        body: TabBarView(children: [
          ListView.separated(
            itemCount: 20,
            separatorBuilder: ((context, index) => Gaps.v3),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("ListTile$index"),
              );
            },
          ),
          const Text('2'),
          const Text('3'),
        ]),
      ),
    );
  }
}
