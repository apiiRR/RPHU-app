import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/utilities.dart';
import '../../routes/route_name.dart';
import '../../view_model/order_view_model.dart';
import 'components/body.dart';

class DetailOrderScreen extends StatelessWidget {
  const DetailOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryMaroon,
        title: Text(
          "Detail Order",
          style: text16(white, bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    context: context,
                    builder: (context) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: ListView.separated(
                            itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8))),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Are you sure ?",
                                                style: text16(black, regular),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: size.width,
                                                child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                kPrimaryMaroon),
                                                    onPressed: () {
                                                      if (orderViewModel
                                                                  .selectedOrder!
                                                                  .state !=
                                                              "validate" &&
                                                          orderViewModel
                                                                  .selectedOrder!
                                                                  .state !=
                                                              "cancel") {
                                                        orderViewModel
                                                            .deleteData()
                                                            .then((value) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      value)));
                                                          Navigator
                                                              .pushNamedAndRemoveUntil(
                                                                  context,
                                                                  RouteName
                                                                      .homeScreen,
                                                                  (route) =>
                                                                      false);
                                                          orderViewModel
                                                              .clearSelectedData();
                                                        });
                                                      } else {
                                                        Navigator.pop(context);
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                const SnackBar(
                                                                    content: Text(
                                                                        "Data with status validate and cancel cannot be deleted")));
                                                      }
                                                    },
                                                    child: Text(
                                                      "Yes, sure!",
                                                      style:
                                                          text18(white, bold),
                                                    )),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                child: const Text(
                                  "Delete",
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const Divider(
                                  thickness: 1,
                                ))));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: const Body(),
    );
  }
}
