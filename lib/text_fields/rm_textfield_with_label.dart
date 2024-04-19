import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rmdev_widgets/text_fields/rm_textfield.dart';
import 'package:simple_shadow/simple_shadow.dart';

class InputTextField extends StatelessWidget {
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
  final bool useSuffixShadow;
  final bool? filled;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function onInputChanged;
  final Widget? suffix;
  final Widget? prefix;
  final bool isDarkMode;
  final TextStyle? labelTextStyle;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final Color? labelDarkModeTextColor;
  final double fieldBorderRadius;
  final double prefixSize;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;

  const InputTextField({
    Key? key,
    required this.label,
    this.controller,
    this.isLabelHorizontalLabel = false,
    required this.isDarkMode,
    this.hintText,
    this.hintTextColor,
    this.labelTextColor,
    this.labelDarkModeTextColor,
    this.validator,
    this.onTap,
    this.fieldBorderRadius = 5.7,
    this.labelFontWeight,
    this.isReadOnly = false,
    this.isDropDown = false,
    this.labelFontSize,
    this.hideBorder = false,
    this.showLabel = true,
    this.suffix,
    this.prefix,
    this.filled,
    this.onFieldSubmitted,
    this.focusNode,
    this.prefixSize = 24,
    this.fillColor,
    this.useSuffixShadow = false,
    this.labelTextStyle,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    required this.onInputChanged,
  }) : super(key: key);

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
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      filled: filled,
      hintTextColor: hintTextColor,
      onTap: onTap,
      prefixIcon: prefix,
      constrainPrefix: true,
      validator: validator,
      hideBorder: hideBorder,
      textInputAction: textInputAction,
      textInputType: textInputType,
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
      onChanged: (value) => onInputChanged(value),
    );
  }

  Visibility buildLabel(BuildContext context) {
    return Visibility(
      visible: showLabel,
      child: SizedBox(
        width: isLabelHorizontalLabel
            ? 50
            : double.maxFinite,
        child: AutoSizeText(
          label,
          style: labelTextStyle ??
              Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isDarkMode
                      ? (labelDarkModeTextColor ??
                      const Color(0xff2CA5DF))
                      : (labelTextColor ??
                      const Color(0xFF23404E)),
                  fontWeight: labelFontWeight ?? FontWeight.w600,
                  fontSize: labelFontSize ?? 15),
        ),
      ),
    );
  }
}
