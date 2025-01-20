import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/generated/assets.dart';
import 'package:toastification/toastification.dart';

class RmToasts {
  static SnackbarController showGetToast({
    String? title,
    String? message,
    double? borderRadius,
    double bgOpacity = .8,
    bool showCloseIcon = true,
    bool isDismissible = true,
    Widget? icon,
    Color bgColor = Colors.black,
    EdgeInsets? padding,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    ToastType toastType = ToastType.info,
    DismissDirection dismissDirection = DismissDirection.down,
    Function(GetSnackBar)? onTap,
  }) {
    assert(title != null || message != null);
    return Get.snackbar("", "",
        isDismissible: isDismissible,
        dismissDirection: dismissDirection,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 3),
        onTap: onTap,
        backgroundColor: bgColor.withOpacity(bgOpacity),
        borderRadius: borderRadius,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
        titleText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title!,
                      style: Get.context?.textTheme.bodyMedium
                          ?.copyWith(color: Colors.white)),
                  Visibility(
                    visible: message != null,
                    child: Text(message ?? "",
                        style: Get.context?.textTheme.bodyMedium
                            ?.copyWith(height: 1, color: Colors.white)),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: showCloseIcon,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x5c454545),
                  ),
                  child: const Icon(Icons.close_rounded,
                      color: Colors.white, size: 20),
                ),
              ),
            )
          ],
        ),
        messageText: const Visibility(visible: false, child: SizedBox.shrink()),
        icon:
            icon ?? SvgPicture.asset(toastType.icon, package: "rmdev_widgets"),
        snackPosition: snackPosition);
  }

  static ToastificationItem notificationToast(BuildContext context,
      {Widget? icon,
      String title = "No Internet Connection",
      Color bgColor = Colors.white,
      double borderRadius = 11.0,
      double bgOpacity = 1,
        int duration = 2,
      String msg = "Please check your internet connection."}) {
    return toastification.showCustom(
      context: context,
      alignment: Alignment.topCenter,
      autoCloseDuration: Duration(seconds: duration),
      builder: (context, item) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor.withOpacity(bgOpacity),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 62,
                child: icon ??
                    Image.asset(
                      Assets.iconsNoConnection,
                      height: 62,
                      package: "rmdev_widgets",
                    ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: context.mediaQuery.size.width,
                      child: Text(
                        title,
                        style: context.textTheme.headlineSmall
                            ?.copyWith(fontSize: 22),
                      ),
                    ),
                    SizedBox(
                      width: context.mediaQuery.size.width,
                      child: Text(
                        msg,
                        style: context.textTheme.bodyMedium?.copyWith(
                            fontSize: 15, color: const Color(0XFF535353)),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

enum ToastType {
  info(Assets.iconsWarning),
  error(Assets.iconsRedCancel),
  success(Assets.iconsGreenCheck);

  const ToastType(this.icon);

  final String icon;
}
