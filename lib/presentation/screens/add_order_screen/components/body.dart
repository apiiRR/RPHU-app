import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rphu_app/utilities/utilities.dart';
import 'package:validators/validators.dart';
import '../../../../data/model/add_product_model.dart';
import '../../../../data/model/product_model.dart';
import '../../../view_model/order_view_model.dart';
import 'build_input_category.dart';
import 'build_input_product.dart';
import 'build_input_quantity.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? category;
  ProductModel? product;
  double? quantity;

  @override
  Widget build(BuildContext context) {
    OrderViewModel orderViewModel = Provider.of<OrderViewModel>(context);
    Size size = MediaQuery.of(context).size;
    TextEditingController quantityController = TextEditingController();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                BuildInputCategory(
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        category = value;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                BuildInputProduct(
                  onChanged: (ProductModel? value) {
                    if (value != null) {
                      setState(() {
                        product = value;
                      });
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BuildInputQuantity(controller: quantityController),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (category != null &&
                          product != null &&
                          quantityController.text.isNotEmpty) {
                        if (isNumeric(quantityController.text)) {
                          orderViewModel.addSelectedData = AddProduct(
                              productId: product!.id,
                              productName: product!.name,
                              qty: double.parse(
                                  quantityController.text.toString()),
                              category: category!);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Quantity must be numbers"),
                            duration: Duration(seconds: 1),
                          ));
                        }
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("All inputs are required"),
                          duration: Duration(seconds: 1),
                        ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryMaroon,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle_rounded,
                          color: white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Add Item",
                          style: text14(white, medium),
                        )
                      ],
                    )),
              ],
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
          if (orderViewModel.selectedData != null &&
              orderViewModel.selectedData!.isNotEmpty) ...[
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
                    trailing: IconButton(
                        onPressed: () {
                          orderViewModel.deleteSelectedData(
                              orderViewModel.selectedData![index]);
                        },
                        icon: const Icon(Icons.delete)),
                  );
                }),
            const SizedBox(
              height: 24,
            ),
          ] else ...[
            Expanded(
                child: Center(
              child: Text(
                "Data is Empty",
                style: text14(black, regular),
              ),
            ))
          ]
        ],
      ),
    );
  }
}
