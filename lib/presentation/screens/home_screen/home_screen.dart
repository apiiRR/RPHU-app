import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/utilities.dart';
import '../../routes/route_name.dart';
import '../../view_model/order_view_model.dart';
import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<OrderViewModel>(context, listen: false).getAllData();
    });
  }

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
        onPressed: () {
          Navigator.pushNamed(context, RouteName.addOrderScreen);
        },
        backgroundColor: kPrimaryMaroon,
        child: const Icon(Icons.add),
      ),
    );
  }
}
