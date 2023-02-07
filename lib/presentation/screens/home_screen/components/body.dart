import 'package:flutter/material.dart';

import '../../../../utilities/utilities.dart';
import 'build_item_recap_order.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Text(
                "View All Order",
                style: text14(kPrimaryMaroon, medium),
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
                const BuildItemRecapOrder(
                  title: "Draft",
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                ),
                const BuildItemRecapOrder(
                  title: "Validated",
                ),
                Container(
                  width: 2,
                  height: 40,
                  color: Colors.white,
                ),
                const BuildItemRecapOrder(
                  title: "Canceled",
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
          ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
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
                          offset:
                              const Offset(0, 1), // changes position of shadow
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
                              "RPHU/API/23/02/06/066",
                              style: text14(black, bold),
                            ),
                            Text(
                              "Validated",
                              style: text12(const Color(0xFF219653), medium),
                            )
                          ],
                        ),
                        Text(
                          "3 Items",
                          style: text12(black, medium),
                        ),
                        Text(
                          "1 Raw Material, 2 Result",
                          style: text12(black, light),
                        )
                      ],
                    ),
                  )),
        ],
      ),
    );
  }
}
