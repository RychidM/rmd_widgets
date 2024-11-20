import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rmdev_widgets/text_fields/rm_textfield.dart';
import 'package:simple_shadow/simple_shadow.dart';

/// A customizable text field with a label.
class RmLabelTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String label;
  final bool isLabelHorizontalLabel;
  final bool hideBorder;
  final FontWeight? labelFontWeight;
  final double? labelFontSize;
  final bool showLabel;
  final VoidCallback? onTap;
  final bool isDropDown;
  final bool isReadOnly;
  final bool obscureText;
  final bool useSuffixShadow;
  final bool? filled;
  final Color? fillColor;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingTop;
  final double contentPaddingBottom;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function(String)? onInputChanged;
  final Widget? suffix;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final bool isDarkMode;
  final TextStyle? labelTextStyle;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Color? labelDarkModeTextColor;
  final double fieldBorderRadius;
  final double prefixSize;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final FocusNode? focusNode;
  final int maxLines;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;

  const RmLabelTextField({
    super.key,
    this.label = '',
    this.controller,
    this.isLabelHorizontalLabel = false,
    this.isDarkMode = false,
    this.hintText,
    this.hintTextColor,
    this.labelTextColor,
    this.labelDarkModeTextColor,
    this.validator,
    this.onTap,
    this.onEditingComplete,
    this.fieldBorderRadius = 5.7,
    this.contentPaddingRight = 10.0,
    this.contentPaddingLeft = 10.0,
    this.contentPaddingTop = 10.0,
    this.contentPaddingBottom = 10.0,
    this.labelFontWeight,
    this.isReadOnly = false,
    this.isDropDown = false,
    this.labelFontSize,
    this.hideBorder = false,
    this.showLabel = true,
    this.obscureText = false,
    this.suffix,
    this.prefix,
    this.filled,
    this.border,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.focusNode,
    this.prefixSize = 24,
    this.fillColor,
    this.maxLines = 1,
    this.useSuffixShadow = false,
    this.labelTextStyle,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.onInputChanged,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    return isLabelHorizontalLabel
        ? buildHorizontalView(context)
        : buildVerticalView(context);
  }

  Column buildVerticalView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel(context),
        const SizedBox(
          height: 15,
        ),
        buildFormField(),
      ],
    );
  }

  Row buildHorizontalView(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildLabel(context),
        const SizedBox(
          width: 25,
        ),
        Expanded(child: buildFormField()),
      ],
    );
  }

  RmTextFormField buildFormField() {
    return RmTextFormField(
      isDarkMode: isDarkMode,
      controller: controller,
      isReadOnly: isReadOnly,
      isDropDown: isDropDown,
      hintText: hintText ?? '',
      fillColor: fillColor,
      obscureText: obscureText,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      filled: filled,
      hintTextColor: hintTextColor,
      onTap: onTap,
      prefixIcon: prefix,
      constrainPrefix: true,
      contentPaddingBottom: contentPaddingBottom,
      contentPaddingLeft: contentPaddingLeft,
      contentPaddingRight: contentPaddingRight,
      contentPaddingTop: contentPaddingTop,
      onEditingComplete: onEditingComplete,
      enabledBorder: enabledBorder,
      disabledBorder: disabledBorder,
      focusedErrorBorder: focusedBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      noBorder: border ?? InputBorder.none,
      inputFormatters: inputFormatters,
      validator: validator,
      hideBorder: hideBorder,
      textInputAction: textInputAction,
      textInputType: textInputType,
      maxLines: maxLines,
      prefixSize: prefixSize,
      fieldBorderRadius: fieldBorderRadius,
      suffixIcon: isDarkMode
          ? suffix
          : useSuffixShadow
              ? (suffix != null
                  ? SimpleShadow(
                      opacity: 0.27,
                      offset: const Offset(-4, 4),
                      sigma: 3,
                      child: suffix!)
                  : null)
              : suffix,
      onChanged: onInputChanged,
    );
  }

  Visibility buildLabel(BuildContext context) {
    return Visibility(
      visible: showLabel,
      child: SizedBox(
        width: isLabelHorizontalLabel ? 50 : double.maxFinite,
        child: AutoSizeText(
          label,
          style: labelTextStyle ??
              Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isDarkMode
                      ? (labelDarkModeTextColor ?? const Color(0xff2CA5DF))
                      : (labelTextColor ?? const Color(0xFF23404E)),
                  fontWeight: labelFontWeight ?? FontWeight.w600,
                  fontSize: labelFontSize ?? 15),
        ),
      ),
    );
  }
}
