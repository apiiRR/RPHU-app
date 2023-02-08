import 'package:flutter/material.dart';

import '../../../../utilities/utilities.dart';

class BuildInputQuantity extends StatelessWidget {
  const BuildInputQuantity({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        style: text14(kPrimaryMaroon, bold),
        cursorColor: kPrimaryMaroon,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: "Quantity",
            labelStyle: text14(kPrimaryColor, regular),
            isDense: true,
            filled: true,
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kPrimaryMaroon, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: kPrimaryMaroon)),
            suffix: Text(
              "/ kg",
              style: text14(kPrimaryMaroon, medium),
            )),
      ),
    );
  }
}