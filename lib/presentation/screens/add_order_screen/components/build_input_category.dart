import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../../utilities/utilities.dart';

class BuildInputCategory extends StatelessWidget {
  const BuildInputCategory({super.key, required this.onChanged});

  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownSearch<String>(
        clearButtonProps: const ClearButtonProps(isVisible: true),
        popupProps: PopupProps.menu(
            showSelectedItems: true,
            constraints: const BoxConstraints(maxHeight: 150),
            itemBuilder: (context, item, _) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  item,
                  style: text14(kPrimaryMaroon, regular),
                ),
              );
            }),
        items: const ["from ids", "to ids", "byproduct ids"],
        dropdownDecoratorProps: DropDownDecoratorProps(
          baseStyle: text14(kPrimaryMaroon, bold),
          dropdownSearchDecoration: InputDecoration(
            labelText: "Category",
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
