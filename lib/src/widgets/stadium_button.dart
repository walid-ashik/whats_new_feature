import 'package:flutter/material.dart';

/// some
class StadiumButton extends StatelessWidget {
  ///
  const StadiumButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.leftPadding = 40,
    this.rightPadding = 40,
    this.isLoading = false,
    this.color,
  }) : super(key: key);

  final Widget child;
  final VoidCallback onTap;
  final double leftPadding;
  final double rightPadding;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.black,
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        height: 42,
        margin: EdgeInsets.only(left: leftPadding, right: rightPadding),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: Colors.black,
                  strokeWidth: 2,
                )
              : child,
        ),
      ),
    );
  }
}
