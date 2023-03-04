import 'package:flutter/material.dart';
import 'package:nuserver/constants/sizes.dart';

class NavTab extends StatelessWidget {
  const NavTab({
    Key? key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final Function onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (() => onTap()),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size10,
            vertical: Sizes.size10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.black : Colors.grey.shade600,
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
