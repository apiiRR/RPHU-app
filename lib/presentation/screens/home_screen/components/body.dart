import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/order_model.dart';
import '../../../../utilities/utilities.dart';
import '../../../routes/route_name.dart';
import '../../../view_model/order_view_model.dart';
import 'build_item_recap_order.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    final isLoading = orderViewModel.state == OrderViewState.loading;
    final isError = orderViewModel.state == OrderViewState.error;

    String countState(state) {
      if (orderViewModel.dataOrder != null &&
          orderViewModel.dataOrder!.isNotEmpty) {
        final List data = orderViewModel.dataOrder!
            .where((element) => element.state == state)
            .toList();
        return data.length.toString();
      } else {
        return "0";
      }
    }

    List countItem(OrderModel index) {
      final int fromIds = index.fromIds.length;
      final int toIds = index.toIds.length;
      final int byProduct = index.byproductIds.length;
      final int total = fromIds + toIds + byProduct;
      final List result = [fromIds, toIds, byProduct, total];
      return result;
    }

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: kPrimaryMaroon,
        ),
      );
    }

    if (isError) {
      return const Center(
        child: Text("Error"),
      );
    }

    return SingleChildScrollView(
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
                "Recap Order",
                style: text18(black, bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.orderScreen);
                },
                child: Text(
                  "View All Order",
                  style: text14(kPrimaryMaroon, medium),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: kPrimaryMaroon,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BuildItemRecapOrder(
                  title: "Draft",
                  quantity: countState("draft"),
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                ),
                BuildItemRecapOrder(
                  title: "Validated",
                  quantity: countState("validate"),
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                ),
                BuildItemRecapOrder(
                  title: "Canceled",
                  quantity: countState("cancel"),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Last Order",
            style: text18(black, bold),
          ),
          const SizedBox(
            height: 10,
          ),
          if (orderViewModel.dataOrder != null &&
              orderViewModel.dataOrder!.isNotEmpty) ...[
            ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        orderViewModel
                            .detailData(orderViewModel.dataOrder![index]);
                        Navigator.pushNamed(
                            context, RouteName.detailOrderScreen);
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
                                  style:
                                      text12(const Color(0xFF219653), medium),
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
                    )),
            const SizedBox(
              height: 16,
            )
          ] else ...[
            const Center(
              child: Text("Data is empty"),
            )
          ]
        ],
      ),
    );
  }
}
