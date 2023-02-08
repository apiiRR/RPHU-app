import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utilities/utilities.dart';
import '../../../view_model/order_view_model.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          TextField(
            controller: controller,
            style: text14(kPrimaryMaroon, bold),
            cursorColor: kPrimaryMaroon,
            maxLines: 2,
            decoration: InputDecoration(
              labelText: "Description",
              labelStyle: text14(kPrimaryColor, regular),
              isDense: true,
              filled: true,
              contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: kPrimaryMaroon, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kPrimaryMaroon)),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "List Order",
            style: text18(black, bold),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
              itemCount: orderViewModel.selectedData!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    orderViewModel.selectedData![index].productName,
                    style: text16(black, semibold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category : ${orderViewModel.selectedData![index].category}",
                        style: text14(black, regular),
                      ),
                      Text(
                        "Quantity : ${orderViewModel.selectedData![index].qty} kg",
                        style: text14(black, medium),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
