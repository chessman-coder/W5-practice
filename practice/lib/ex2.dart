import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            CustomButton(
              text: 'submit',
              icon: Icons.check,
              iconPosition: IconPosition.right,
              buttonType: ButtonType.primary,
            ),
            CustomButton(
              text: 'Time',
              icon: Icons.time_to_leave,
              buttonType: ButtonType.secondary,
            ),
            CustomButton(
              text: 'Account',
              icon: Icons.disabled_by_default,
              iconPosition: IconPosition.left,
              buttonType: ButtonType.disabled,
            ),
          ],
        ),
      ),
    ),
  );
}

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color getButtonColor() {
    switch (buttonType) {
      case ButtonType.disabled:
        return Colors.grey;
      case ButtonType.secondary:
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = buttonType == ButtonType.disabled;

    return Container(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: isDisabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: getButtonColor(),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        ),
        child: buildIconPosition(),
      ),
    );
  }

  Widget buildIconPosition() {
    if (iconPosition == IconPosition.left) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.white)),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: Colors.white)),
          const SizedBox(width: 8),
          Icon(icon, color: Colors.white),
        ],
      );
    }
  }
}
