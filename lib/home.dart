import 'dart:math';

import 'package:card/card.dart';
import 'package:card/detail.dart';
import 'package:card/provider.dart';
import 'package:card/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

const data = <ListItemData>[
  ListItemData(
    color: Colors.blue,
    limit: 82232,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.ac_unit,
  ),
  ListItemData(
    color: Colors.red,
    limit: 2342,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.access_alarm,
  ),
  ListItemData(
    color: Colors.orange,
    limit: 123,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.yard_outlined,
  ),
  ListItemData(
    color: Colors.yellow,
    limit: 0000,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.track_changes,
  ),
  ListItemData(
    color: Colors.amber,
    limit: 234,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.account_balance_outlined,
  ),
  ListItemData(
    color: Colors.cyan,
    limit: 56464654,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.file_download,
  ),
  ListItemData(
    color: Colors.grey,
    limit: 23423,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.remove_red_eye_sharp,
  ),
  ListItemData(
    color: Colors.blue,
    limit: 82232,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.ac_unit,
  ),
  ListItemData(
    color: Colors.red,
    limit: 2342,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.access_alarm,
  ),
  ListItemData(
    color: Colors.orange,
    limit: 123,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.yard_outlined,
  ),
  ListItemData(
    color: Colors.yellow,
    limit: 0000,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.track_changes,
  ),
  ListItemData(
    color: Colors.amber,
    limit: 234,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.account_balance_outlined,
  ),
  ListItemData(
    color: Colors.cyan,
    limit: 56464654,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.file_download,
  ),
  ListItemData(
    color: Colors.grey,
    limit: 23423,
    transaction: 3,
    title: 'Aliquam tortor ipsum',
    icon: Icons.remove_red_eye_sharp,
  )
];

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final creaditCardMargin = EdgeInsetsTween(
    begin: const EdgeInsets.only(top: kToolbarHeight + 40),
    end: const EdgeInsets.only(top: kToolbarHeight),
  );

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final tempVal = 34 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;

    final cardMargin = creaditCardMargin.lerp(progress);

    return Stack(
      children: <Widget>[
        const SizedBox.expand(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF9F8F9),
                  Color(0x00F9F8F9),
                ],
                begin: Alignment(0, 0.6),
                end: Alignment(0, 1),
              ),
            ),
          ),
        ),
        Padding(
          padding: cardMargin,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailScreen()),
              );
            },
            child: CreditCard(
              color: context.watch<ColorProvider>().color,
              collapsed: progress > 0.5,
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 350;

  @override
  double get minExtent => 200;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return false;
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          pinned: true,
          delegate: _TransitionAppBarDelegate(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListItem(data[index]);
            },
            childCount: data.length,
          ),
        ),
      ],
    ));
  }
}
