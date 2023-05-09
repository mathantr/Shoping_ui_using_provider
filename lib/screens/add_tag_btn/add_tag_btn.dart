// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class AddTagBtn extends StatelessWidget {
  const AddTagBtn({
    Key? key,
    required this.onTap,
    required this.name,
  }) : super(key: key);
  final void Function() onTap;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 40,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: liteGreen,
          ),
          child: Text(
            name,
            style: header.copyWith(
                color: black, fontWeight: FontWeight.w700, fontSize: 26),
          ),
        ),
      ),
    );
  }
}
