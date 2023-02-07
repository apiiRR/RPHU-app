import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';
import 'components/body.dart';

class AddOrderScreen extends StatelessWidget {
  const AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryMaroon,
        title: Text(
          "Add Order",
          style: text16(white, bold),
        ),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
