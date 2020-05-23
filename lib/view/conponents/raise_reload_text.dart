import 'package:flutter/material.dart';
import 'package:newfeedapp/view/conponents/transition.dart';

class LazyLoadText extends StatelessWidget {
  LazyLoadText({this.text, this.pageVisibility});

  final String text;
  final PageVisibility pageVisibility;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.title;
    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: Alignment.topLeft,
        transform: Matrix4.translationValues(
            pageVisibility.pagePosition * 1000, 0.0, 0.0),
        child: Text(
          text,
          style: textTheme.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
