import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/utilities.dart';
import '../../routes/route_name.dart';
import '../../view_model/order_view_model.dart';
import 'components/body.dart';

class AddOrderScreen extends StatelessWidget {
  const AddOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        bottomSheet: Consumer<OrderViewModel>(
            builder: (context, orderViewModel, child) => Container(
                  width: size.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 1)),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05, vertical: 8),
                    child: ElevatedButton(
                        onPressed: () {
                          if (orderViewModel.selectedData != null &&
                              orderViewModel.selectedData!.isNotEmpty) {
                            Navigator.pushNamed(
                                context, RouteName.confirmationScreen);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                orderViewModel.selectedData != null &&
                                        orderViewModel.selectedData!.isNotEmpty
                                    ? kPrimaryMaroon
                                    : Colors.grey[400],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          "Checkout",
                          style: text16(white, bold),
                        )),
                  ),
                )));
  }
}
