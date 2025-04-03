import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

/// A customizable text field without a label.
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
  final double? contentPaddingLeft;
  final double? contentPaddingRight;
  final double? contentPaddingTop;
  final double? contentPaddingBottom;
  final double contentPaddingAll;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? noBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final bool? filled;
  final Color? fillColor;
  final Color? hintTextColor;
  final double? prefixSize;
  final double textFont;
  final Color? cursorColor;
  final Color? textColor;
  final double? suffixSize;
  final double fieldBorderRadius;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final Function()? onEditingComplete;
  final InputDecoration? decoration;

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
    this.contentPaddingRight,
    this.contentPaddingLeft,
    this.contentPaddingTop,
    this.contentPaddingBottom,
    this.contentPaddingAll = 10,
    this.cursorColor,
    this.isDarkMode = false,
    this.constrainPrefix = true,
    this.inputFormatters,
    this.onEditingComplete,
    this.suffixIcon,
    this.focusNode,
    this.prefixIcon,
    this.prefixSize,
    this.suffixSize,
    this.onChanged,
    this.maxLength,
    this.minLines,
    this.maxLines,
    this.filled,
    this.fillColor,
    this.validator,
    this.hideBorder = false,
    this.onFieldSubmitted,
    this.noBorder = InputBorder.none, this.textColor, this.textFont = 18, this.decoration,
    this.enabledBorder, this.disabledBorder, this.focusedBorder, this.focusedErrorBorder, this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      style: theme.textTheme.bodyLarge?.copyWith(fontSize: textFont, color: textColor),
      readOnly: isDropDown ? true : isReadOnly,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      validator: validator,
      inputFormatters: inputFormatters,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enableInteractiveSelection: true,
      cursorColor:  cursorColor,
      decoration: decoration ?? InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(
          contentPaddingLeft ?? contentPaddingAll,
          contentPaddingTop ?? contentPaddingAll,
          contentPaddingRight ?? contentPaddingAll,
          contentPaddingBottom ?? contentPaddingAll,
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
            ? focusedBorder
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
            ? focusedErrorBorder
            : OutlineInputBorder(
                borderRadius: BorderRadius.circular(fieldBorderRadius),
                borderSide: BorderSide(
                    color: theme.colorScheme.error,
                    width: isDarkMode ? 1 : 0.5),
              ),
        disabledBorder: disabledBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(fieldBorderRadius),
          borderSide: BorderSide(
              color: theme.disabledColor, width: isDarkMode ? 1 : 0.5),
        ),
      ),
    );
  }
}
