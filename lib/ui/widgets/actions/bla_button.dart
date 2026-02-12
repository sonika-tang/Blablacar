import 'package:flutter/material.dart';
import '../../theme/theme.dart';

enum ButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconData? icon;

  const BlaButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isPrimary = type == ButtonType.primary;

    final backgroundColor = isPrimary ? BlaColors.primary : BlaColors.white;
    final border = isPrimary
        ? BorderSide.none
        : BorderSide(color: BlaColors.greyLight, width: 2);
    final contentColor = isPrimary ? BlaColors.white : BlaColors.primary;

    return SizedBox(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
          ),
          side: border,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: contentColor),
              SizedBox(width: BlaSpacings.s),
            ],
            Text(
              text,
              style: BlaTextStyles.button.copyWith(color: contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
