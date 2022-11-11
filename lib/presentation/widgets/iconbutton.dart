import 'package:countries/core/colors.dart';
import 'package:flutter/material.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon({
    Key? key,
    required this.label,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);
  final String label;
  final IconData icon;
  final Widget onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => onPressed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28)))),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Theme.of(context).primaryColor,
            )),
        child: Row(
          children: [Icon(icon), const SizedBox(width: 4), Text(label)],
        ),
      ),
    );
  }
}
