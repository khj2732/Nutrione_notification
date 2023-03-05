import 'package:flutter/material.dart';
import 'package:nuserver/constants/gaps.dart';

class NotiScreen extends StatelessWidget {
  static const routeName = '/noti';
  const NotiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('noti')),
      body: ListView(
        children: [
          ListTile(
            leading: const Text(
              "2023-03-05",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Nutrione'),
            subtitle: const Text("배송 오류"),
            tileColor: Colors.grey.shade200,
            selectedTileColor: Colors.yellow.shade100,
          ),
          Gaps.v5,
          ListTile(
            leading: const Text(
              "2023-03-03",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            title: const Text('Mypuzzle'),
            subtitle: const Text("결제 오류"),
            tileColor: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}
