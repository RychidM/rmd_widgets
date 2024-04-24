import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RmTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool hideBorder;
  final bool isReadOnly;
  final bool isDropDown;
  final bool isDarkMode;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool constrainPrefix;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final Function(String)? onFieldSubmitted;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingTop;
  final double contentPaddingBottom;
  final InputBorder noBorder;
  final bool? filled;
  final Color? fillColor;
  final Color? hintTextColor;
  final double? prefixSize;
  final double? suffixSize;
  final double fieldBorderRadius;
  final FocusNode? focusNode;
  final int? minLines;
  final int maxLines;

  const RmTextFormField({
    super.key,
    required this.hintText,
    this.hintTextColor,
    this.controller,
    this.onTap,
    this.fieldBorderRadius = 5.7,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.isReadOnly = false,
    this.isDropDown = false,
    this.contentPaddingRight = 10.0,
    this.contentPaddingLeft = 10.0,
    this.contentPaddingTop = 10.0,
    this.contentPaddingBottom = 10.0,
    this.isDarkMode = false,
    this.constrainPrefix = true,
    this.suffixIcon,
    this.focusNode,
    this.prefixIcon,
    this.prefixSize,
    this.suffixSize,
    this.onChanged,
    this.maxLength,
    this.minLines,
    this.maxLines = 1,
    this.filled,
    this.fillColor,
    this.validator,
    this.hideBorder = false,
    this.onFieldSubmitted,
    this.noBorder = const OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18),
      readOnly: isDropDown ? true : isReadOnly,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      enableInteractiveSelection: true,
      cursorColor: isDarkMode ? Colors.white : Colors.black,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(
          contentPaddingLeft,
          contentPaddingTop,
          contentPaddingRight,
          contentPaddingBottom,
        ),
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
        hintStyle: theme.textTheme.bodySmall?.copyWith(
            fontSize: 15, fontWeight: FontWeight.w300, color: hintTextColor),
        errorStyle: theme.textTheme.bodySmall
            ?.copyWith(color: Colors.red, fontSize: 12),
        suffixIcon: isDropDown
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: RotatedBox(
                        quarterTurns: 1,
                        child: Icon(Icons.arrow_forward_ios_rounded)),
                  ),
                  Visibility(
                    visible: suffixIcon != null,
                    child: suffixSize != null
                        ? SizedBox(
                            width: 35,
                            height: 35,
                            child: suffixIcon,
                          )
                        : const SizedBox.shrink(),
                  ),
                  const Gap(5),
                ],
              )
            : Center(child: suffixIcon),
        errorMaxLines: 2,
        suffixIconConstraints: BoxConstraints(
            minHeight: suffixSize != null ? suffixSize! : 49,
            minWidth: isDropDown
                ? 70
                : suffixSize != null
                    ? suffixSize!
                    : 49,
            maxHeight: suffixSize != null ? suffixSize! : 49,
            maxWidth: isDropDown
                ? 70
                : suffixSize != null
                    ? suffixSize!
                    : 49),
        prefixIconConstraints: constrainPrefix
            ? BoxConstraints(
                minHeight: prefixSize != null ? prefixSize! : 16,
                minWidth: prefixSize != null ? prefixSize! : 16,
                maxHeight: prefixSize != null ? prefixSize! : 16,
                maxWidth: prefixSize != null ? prefixSize! : 16)
            : null,
        prefixIcon: prefixIcon,
        enabledBorder: hideBorder
            ? noBorder
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(fieldBorderRadius),
                borderSide: BorderSide(
                    color: isDarkMode
                        ? const Color(0xff797979)
                        : const Color(0xFFCBC8C8),
                    width: isDarkMode ? 1 : 0.5),
              ),
        focusedBorder: hideBorder
            ? noBorder
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(fieldBorderRadius),
                borderSide: BorderSide(
                    color: const Color(0xFFCBC8C8),
                    width: isDarkMode ? 1 : 0.5),
              ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldBorderRadius),
          borderSide: BorderSide(
              color: theme.colorScheme.error, width: isDarkMode ? 1 : 0.5),
        ),
        focusedErrorBorder: hideBorder
            ? noBorder
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(fieldBorderRadius),
                borderSide: BorderSide(
                    color: theme.colorScheme.error,
                    width: isDarkMode ? 1 : 0.5),
              ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldBorderRadius),
          borderSide: BorderSide(
              color: theme.disabledColor, width: isDarkMode ? 1 : 0.5),
        ),
      ),
    );
  }
}
