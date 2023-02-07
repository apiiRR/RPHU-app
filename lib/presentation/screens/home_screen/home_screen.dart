import 'package:flutter/material.dart';

import '../../../utilities/utilities.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryMaroon,
        title: Text(
          "Beranda",
          style: text16(white, bold),
        ),
        centerTitle: true,
      ),
      body: const Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryMaroon,
        child: const Icon(Icons.add),
      ),
    );
  }
}
