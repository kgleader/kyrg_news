import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintext,
    this.maxlines,
    this.controller,
    this.onTap,
    required String? Function(String string) validator,
  }) : super(key: key);
  final String? hintext;
  final TextEditingController? controller;
  final int? maxlines;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxlines,
      onTap: onTap,
      decoration: InputDecoration(
          hintText: hintext,
          label: Text(hintext ?? ""),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
