import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../utilities/utilities.dart';
import '../../../view_model/order_view_model.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    Size size = MediaQuery.of(context).size;
    return orderViewModel.selectedOrder != null &&
            orderViewModel.selectedData != null
        ? SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      orderViewModel.selectedOrder!.name,
                      style: text18(black, bold),
                    ),
                    Text(
                      orderViewModel.selectedOrder!.state,
                      style: text12(const Color(0xFF219653), medium),
                    )
                  ],
                ),
                Text(
                  DateFormat("yyyy-MM-dd")
                      .format(orderViewModel.selectedOrder!.date),
                  style: text14(black, regular),
                ),
                Text(
                  "Description : ${orderViewModel.selectedOrder!.description}",
                  style: text16(black, regular),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                    itemCount: orderViewModel.selectedData!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                        trailing: IconButton(
                            onPressed: () {
                              // showModalBottomSheet(context: context, builder: (context) => )
                            },
                            icon: const Icon(Icons.more_vert_rounded)),
                      );
                    }),
              ],
            ),
          )
        : const SizedBox();
  }
}
