import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const SearchInput({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 6.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          labelText: label,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
