import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.onTap,
    super.key,
    required this.centerText,
  });
  final String centerText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              centerText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
