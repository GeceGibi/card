import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListItemData {
  const ListItemData({
    required this.transaction,
    required this.icon,
    required this.limit,
    required this.title,
    required this.color,
  });

  final IconData icon;
  final String title;
  final int limit;
  final int transaction;
  final Color color;
}

class ListItem extends StatelessWidget {
  const ListItem(this.data, {Key? key}) : super(key: key);

  final ListItemData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Row(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: data.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: 56,
              width: 56,
              child: Center(
                child: Icon(
                  data.icon,
                  color: data.color,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      '${data.transaction} Transactions',
                      style: const TextStyle(color: Color(0xffaaaaaa)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${data.limit.toStringAsFixed(2)}\$',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
