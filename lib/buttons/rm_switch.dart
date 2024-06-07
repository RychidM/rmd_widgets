import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gap/gap.dart';

class RmSwitch extends StatelessWidget {
  final double switchWidth;
  final double switchHeight;
  final Color activeColor;
  final Color inActiveColor;
  final String? label;
  final bool value;
  final double? toggleSize;
  final Function(bool) onToggle;
  final TextStyle? titleTextStyle;
  final MainAxisAlignment? mainAxisAlignment;
  final double? titleSize;
  final Color? titleColor;
  final bool isDarkMode;
  final double padding;
  final double borderRadius;

  const RmSwitch({
    super.key,
    this.switchWidth = 70.0,
    this.switchHeight = 35.0,
    this.activeColor = Colors.amber,
    this.inActiveColor = const Color(0xFFDEE1E7),
    this.titleSize,
    this.titleColor = Colors.black,
    this.label,
    required this.value,
    this.toggleSize,
    this.titleTextStyle,
    required this.onToggle,
    this.mainAxisAlignment,
    this.isDarkMode = false,
    this.padding = 5.0,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
      children: [
        Text(
          label ?? 'label',
          style: titleTextStyle ??
              Theme.of(context).textTheme.bodySmall?.copyWith(
                  letterSpacing: 1,
                  color: titleColor ?? (isDarkMode ? Colors.white : titleColor),
                  fontSize: titleSize ?? 14),
        ),
        const Gap(15),
        FlutterSwitch(
          width: switchWidth,
          height: switchHeight,
          activeColor: activeColor,
          inactiveColor: isDarkMode ? const Color(0xFF595959) : inActiveColor,
          borderRadius: borderRadius,
          value: value,
          padding: padding,
          toggleSize: toggleSize ?? 25.0,
          onToggle: onToggle,
        ),
      ],
    );
  }
}
