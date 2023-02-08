import 'package:flutter/material.dart';

import '../../../../utilities/utilities.dart';

class BuildItemRecapOrder extends StatelessWidget {
  const BuildItemRecapOrder(
      {super.key, required this.title, required this.quantity});

  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: text14(white, light),
        ),
        Text(
          "$quantity Order",
          style: text14(white, bold),
        )
      ],
    );
  }
}
