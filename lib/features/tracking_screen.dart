import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:nuserver/constants/gaps.dart';
import 'package:nuserver/constants/sizes.dart';
import 'package:nuserver/features/noti_screen.dart';

class TrackingScreen extends StatefulWidget {
  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  final tabs = ['배송', '알림', '결제'];

  void _onIconTab(BuildContext context) {
    Navigator.pushNamed(context, NotiScreen.routeName);
  }

  //현재시각 정의.
  DateTime _selectedDate = DateTime.now();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2020),
        lastDate: DateTime.now());

    if (picked != null && picked != _selectedDate) {
      setState(
        () {
          _selectedDate = picked;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isError = false;

    return SafeArea(
      //Appbar까지 스크롫 할 수 있게 하는 위젯.
      child: DefaultTabController(
        length: tabs.length,
        child: CustomScrollView(
          slivers: [
            //Sliver안에서 AppBar위젯.
            SliverAppBar(
              floating: true,
              title: GestureDetector(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd').format(_selectedDate),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.solidBell),
                  onPressed: () => _onIconTab(context),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.symmetric(
                        horizontal: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: TabBar(
                      labelPadding: const EdgeInsets.symmetric(
                        vertical: Sizes.size10,
                      ),
                      indicatorColor: Theme.of(context).primaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      unselectedLabelColor: Colors.grey.shade500,
                      labelColor: Colors.black,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: Sizes.size16),
                      tabs: [
                        for (var tab in tabs)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size20,
                            ),
                            child: Text(tab),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      children: [
                        ListView(
                          children: [
                            ListTile(
                              title: Text(isError ? "500에러!!!" : "정상"),
                              tileColor: isError
                                  ? Colors.red.shade200
                                  : Colors.grey.shade200,
                            ),
                            Gaps.v5,
                            ListTile(
                              title: Text(!isError ? "500에러!!!" : "정상"),
                              tileColor: !isError
                                  ? Colors.red.shade200
                                  : Colors.grey.shade200,
                            ),
                          ],
                        ),
                        /* ListView.separated(
                          itemCount: 1,
                          separatorBuilder: (context, index) => Gaps.v10,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(isError ? "500에러!!!" : "정상"),
                              tileColor: isError
                                  ? Colors.red.shade200
                                  : Colors.grey.shade200,
                            );
                          },
                        ), */
                        const Center(
                          child: Text('알림'),
                        ),
                        const Center(
                          child: Text('결제'),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            /*    SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    color: Colors.teal[100 * (index % 9)],
                    child: Center(child: Text("$index")),
                  );
                },
              ),
              itemExtent: 40,
            ), */
          ],
        ),
      ),
    );
  }
}
