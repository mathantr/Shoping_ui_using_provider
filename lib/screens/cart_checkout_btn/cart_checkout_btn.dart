import 'package:flutter/material.dart';
import 'package:shoes_shops/constants/constants.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    this.onTap,
    required this.label,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              color: liteGreen,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: 50,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Center(
            child: Text(
              label,
              style: header.copyWith(
                  color: white, fontWeight: FontWeight.w800, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
