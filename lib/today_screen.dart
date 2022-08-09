import 'package:flutter/material.dart';

import 'custom_listtile.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          CustomListTile(),
          CustomListTile(),
          CustomListTile(),
          CustomListTile(),
          CustomListTile(),
        ],
      ),
    );
  }
}

