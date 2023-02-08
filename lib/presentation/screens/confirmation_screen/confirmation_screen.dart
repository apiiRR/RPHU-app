import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utilities/utilities.dart';
import '../../routes/route_name.dart';
import '../../view_model/order_view_model.dart';
import 'components/body.dart';

class ConfirmationScreen extends StatefulWidget {
  const ConfirmationScreen({super.key});

  @override
  State<ConfirmationScreen> createState() => _ConfirmationScreenState();
}

class _ConfirmationScreenState extends State<ConfirmationScreen> {
  final TextEditingController descriptionController = TextEditingController();
  String? desc;

  @override
  void initState() {
    super.initState();
    descriptionController.addListener(setValue);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  void setValue() {
    setState(() {
      desc = descriptionController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryMaroon,
          title: Text(
            "Confirmation Order",
            style: text16(white, bold),
          ),
          centerTitle: true,
        ),
        body: Body(
          controller: descriptionController,
        ),
        bottomSheet: Container(
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
                  if (desc != null && desc != "") {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
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
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: kPrimaryMaroon),
                                      onPressed: () {
                                        orderViewModel
                                            .addOrder(desc!)
                                            .then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(value)));
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              RouteName.homeScreen,
                                              (route) => false);
                                        });
                                      },
                                      child: Text(
                                        "Yes, sure!",
                                        style: text18(white, bold),
                                      )),
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: desc != null && desc != ""
                        ? kPrimaryMaroon
                        : Colors.grey[400],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text(
                  "Save",
                  style: text16(white, bold),
                )),
          ),
        ));
  }
}
