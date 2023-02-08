import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/order_model.dart';
import '../../../../utilities/utilities.dart';
import '../../../routes/route_name.dart';
import '../../../view_model/order_view_model.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);

    List countItem(OrderModel index) {
      final int fromIds = index.fromIds.length;
      final int toIds = index.toIds.length;
      final int byProduct = index.byproductIds.length;
      final int total = fromIds + toIds + byProduct;
      final List result = [fromIds, toIds, byProduct, total];
      return result;
    }

    return orderViewModel.dataOrder != null &&
            orderViewModel.dataOrder!.isNotEmpty
        ? ListView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05, vertical: 16),
            itemCount: orderViewModel.dataOrder!.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    orderViewModel.detailData(orderViewModel.dataOrder![index]);
                    Navigator.pushNamed(context, RouteName.detailOrderScreen);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              orderViewModel.dataOrder![index].name,
                              style: text14(black, bold),
                            ),
                            Text(
                              orderViewModel.dataOrder![index].state,
                              style: text12(const Color(0xFF219653), medium),
                            )
                          ],
                        ),
                        Text(
                          orderViewModel.dataOrder![index].description,
                          style: text12(black, medium),
                        ),
                        Text(
                          "${countItem(orderViewModel.dataOrder![index])[3].toString()} Items",
                          style: text12(black, medium),
                        ),
                        Text(
                          "${countItem(orderViewModel.dataOrder![index])[0].toString()} from ids, ${countItem(orderViewModel.dataOrder![index])[1].toString()} to ids, ${countItem(orderViewModel.dataOrder![index])[2].toString()} byproduct ids",
                          style: text12(black, light),
                        )
                      ],
                    ),
                  ),
                ))
        : const Center(
            child: Text("Data is empty"),
          );
  }
}
