import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../data/api/product_api.dart';
import '../../../../data/model/product_model.dart';
import '../../../../utilities/utilities.dart';

class BuildInputProduct extends StatelessWidget {
  const BuildInputProduct({super.key, required this.onChanged});

  final void Function(ProductModel?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownSearch<ProductModel>(
        clearButtonProps: const ClearButtonProps(
          isVisible: true,
        ),
        popupProps: PopupProps.menu(itemBuilder: (context, item, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              item.name,
              style: text14(kPrimaryMaroon, regular),
            ),
          );
        }),
        itemAsString: (item) => item.name,
        asyncItems: (String filter) async {
          try {
            final data = await ProductAPI.getAllProduct();

            if (data["status"] != "oke") {
              throw data["response"];
            }

            final Map<String, dynamic> response =
                data["response"] as Map<String, dynamic>;

            final product = (response["result"]["data"] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();
            return product;
          } catch (e) {
            return List<ProductModel>.empty();
          }
        },
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: text14(kPrimaryMaroon, bold),
          dropdownSearchDecoration: InputDecoration(
            labelText: "Product",
            labelStyle: text14(kPrimaryColor, regular),
            isDense: true,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kPrimaryMaroon, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kPrimaryMaroon)),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}