import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RMCustomSwitch extends StatefulWidget {
  final Function(bool) onToggle;
  final Color backgroundColor;
  final Color? activeBgColor;

  const RMCustomSwitch({
    super.key,
    required this.onToggle,
    this.backgroundColor = Colors.black12,
    this.activeBgColor,
  });

  @override
  State<RMCustomSwitch> createState() => _RMCustomSwitchState();
}

bool _isSwitchedOn = false;

class _RMCustomSwitchState extends State<RMCustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        setState(() {
          _isSwitchedOn = !_isSwitchedOn;
        });
        widget.onToggle.call(_isSwitchedOn);
      },
      child: Container(
        width: 62,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          color:
          _isSwitchedOn
              ? (widget.activeBgColor ?? Theme.of(context).colorScheme.primary)
              : widget.backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 150),
          alignment:
          _isSwitchedOn ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
