import 'package:flutter/material.dart';
import 'package:whats_new_feature/src/widgets/stadium_button.dart';

///
class ContinueButton extends StatelessWidget {
  ///
  const ContinueButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  ///
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.2),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 20,
      ),
      child: Center(
        child: StadiumButton(
          onTap: onTap,
          child: const Text(
            'CONTINUE',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
