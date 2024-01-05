// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String hintText;
  final List<String> items;
  final Function(dynamic)? onChanged;

  CustomDropdownWidget({
    required this.hintText,
    required this.items,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 500,
            color: Colors.white,
            child: DropdownSearch<String>(
              items: items,
              popupProps: PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
                searchDelay: Duration(microseconds: 0),
              ),
              onChanged: (String? selectedItem) {
                if (onChanged != null && selectedItem != null) {
                  onChanged!(selectedItem);
                }
              },
              selectedItem: null,
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: InputBorder.none,
                hintText: 'Select $hintText',
                hintStyle: TextStyle(color: Colors.grey[400]),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
