import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';
import 'components/body.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryMaroon,
        title: Text(
          "Orders",
          style: text16(white, bold),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
