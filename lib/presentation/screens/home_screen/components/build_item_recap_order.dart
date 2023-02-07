import 'package:flutter/material.dart';

import '../../../../utilities/utilities.dart';

class BuildItemRecapOrder extends StatelessWidget {
  const BuildItemRecapOrder({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: text14(white, light),
        ),
        Text(
          "22 Order",
          style: text14(white, bold),
        )
      ],
    );
  }
}
