import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class CardAccordion extends StatelessWidget {
  final String title;
  final String value;
  const CardAccordion({super.key, required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        backgroundColor: bgColor,
        title: Text(title),
        children: [
          Container(
            color: bgColor,
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: HtmlWidget(value),
          )
        ],
      ),
    );
  }
}
