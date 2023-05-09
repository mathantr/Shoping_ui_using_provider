// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shoes_shops/constants/constants.dart';

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    Key? key,
    this.onTap,
    required this.bottonClr,
    required this.title,
  }) : super(key: key);
  final void Function()? onTap;
  final Color bottonClr;
  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.255,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: bottonClr,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: textFont.copyWith(
              color: black,
              fontWeight: FontWeight.w600,
              fontSize: 21,
            ),
          ),
        ),
      ),
    );
  }
}
