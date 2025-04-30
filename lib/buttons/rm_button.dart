import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nb_utils/nb_utils.dart';

/// Creates a customizable button with a loading spinner.
class RmButton extends StatelessWidget {
  final Widget? child;
  final String? label;
  final String? labelLoading;
  final Color? color;
  final bool isDarkMode;
  final Color? darkModeColor;
  final Color labelColor;
  final Color loadingColor;
  final VoidCallback onTap;
  final bool isLoading;
  final Widget? loader;
  final bool isButtonDisabled;
  final double width;
  final FontWeight? fontWeight;
  final double height;
  final double? labelSize;
  final String? labelPrefixAsset;
  final double? buttonCornerRadius;
  final double elevation;
  final EdgeInsetsGeometry? margin;
  final BorderSide? side;
  final Color disabledColor;

  const RmButton({
    super.key,
    this.label,
    this.labelLoading,
    this.color /*= const Color(0xFF040707)*/,
    this.labelColor = Colors.white,
    this.loadingColor = Colors.white,
    this.isDarkMode = false,
    this.child,
    required this.onTap,
    this.isLoading = false,
    this.loader,
    this.width = double.infinity,
    this.darkModeColor = const Color(0xff168FFF),
    this.fontWeight,
    this.labelPrefixAsset,
    this.elevation = 0,
    this.buttonCornerRadius = 13,
    this.isButtonDisabled = false,
    this.height = 60,
    this.labelSize = 16,
    this.margin, this.side, this.disabledColor = const Color(0xFFDEE1E7),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: isButtonDisabled
            ? null
            : ((isLoading == true)
                ? () {}
                : () {
                    HapticFeedback.selectionClick();
                    onTap.call();
                  }),
        style: ElevatedButton.styleFrom(
            disabledForegroundColor: isDarkMode
                ? Colors.grey.shade800
                : const Color.fromRGBO(160, 160, 160, 0.57),
            disabledBackgroundColor:
                isDarkMode ? Colors.grey.shade600 : disabledColor,
            backgroundColor: /*isDarkMode ? darkModeColor :*/ color,
            shape: RoundedRectangleBorder(
              side: side ?? BorderSide.none,
              borderRadius: BorderRadius.circular(buttonCornerRadius ?? 4),
            ),
            elevation: isDarkMode ? 0 : elevation),
        child: (isLoading == true)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  loader ??
                      SpinKitThreeBounce(
                        size: 15,
                        color: loadingColor,
                      ),
                  const SizedBox(width: 10),
                  Text(
                    labelLoading ?? '',
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.white, fontSize: 16),
                  )
                ],
              )
            : (label == '' || label == null)
                ? child
                : TextIcon(
                    text: label ?? '',
                    prefix: labelPrefixAsset != null
                        ? Image(
                            image: AssetImage(labelPrefixAsset!),
                            width: 19,
                            height: 19,
                          )
                        : null,
                    textStyle: theme.textTheme.bodyMedium!.copyWith(
                        color: isButtonDisabled
                            ? const Color.fromRGBO(160, 160, 160, 0.57)
                            : labelColor,
                        fontSize: labelSize,
                        letterSpacing: .5,
                        fontWeight: fontWeight ?? FontWeight.w600),
                  ),
      ),
    );
  }
}
