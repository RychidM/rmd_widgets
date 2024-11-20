import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/generated/assets.dart';

class RmToasts {
  static SnackbarController showGetToast({
    String? title,
    String? message,
    double? borderRadius,
    EdgeInsets? padding,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    ToastType toastType = ToastType.info,
    DismissDirection dismissDirection = DismissDirection.down,
    Function(GetSnackBar)? onTap,
  }) {
    return Get.snackbar("", "",
        dismissDirection: dismissDirection,
        animationDuration: const Duration(seconds: 1),
        duration: const Duration(seconds: 3),
        onTap: onTap,
        backgroundColor: Colors.black.withOpacity(.8),
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
            Padding(
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
            )
          ],
        ),
        messageText: const Visibility(visible: false, child: SizedBox.shrink()),
        icon: SvgPicture.asset(toastType.icon, package: "rmdev_widgets"),
        snackPosition: snackPosition);
  }
}

enum ToastType {
  info(Assets.iconsWarning),
  error(Assets.iconsRedCancel),
  success(Assets.iconsGreenCheck);

  const ToastType(this.icon);

  final String icon;
}
