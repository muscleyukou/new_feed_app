import 'package:flutter/material.dart';
import 'package:newfeedapp/view/screens/conponents/category_info.dart';

class CategoryTips extends StatefulWidget {
  final ValueChanged onCategoryChanged;

  CategoryTips({this.onCategoryChanged});

  @override
  _CategoryTipsState createState() => _CategoryTipsState();
}

class _CategoryTipsState extends State<CategoryTips> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0,
      children: List<Widget>.generate(categories.length, (int index) {
        return ChoiceChip(
          label: Text(categories[index].categoryJp),
          selected: value == index,
          onSelected: (bool isSelected) {
            setState(() {
              value = isSelected ? index : 0;
              widget.onCategoryChanged(categories[index]);
            });
          },
        );
      }),
    );
  }
}
