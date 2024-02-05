import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';


void showCherryErrorToast(BuildContext context,{required Text title, required Text description,Position toastPosition = Position.bottom }) {
  CherryToast.error(
    displayCloseButton: false,
    title: title,
    displayTitle: true,
    description: description,
    animationType: AnimationType.fromLeft,
    animationDuration: const Duration(seconds: 2),
    animationCurve: Curves.fastLinearToSlowEaseIn,
    actionHandler: () {},
    autoDismiss: true,
    toastPosition: toastPosition,
  ).show(context);
}
void showCherrySuccessToast(BuildContext context,{required Text title, required Text description,Position toastPosition = Position.bottom }) {
  CherryToast.success(
    displayCloseButton: false,
    title: title,
    displayTitle: true,
    description: description,
    animationType: AnimationType.fromLeft,
    animationDuration: const Duration(seconds: 2),
    animationCurve: Curves.fastLinearToSlowEaseIn,
    actionHandler: () {},
    autoDismiss: true,
    toastPosition: toastPosition,
  ).show(context);
}
void showCherryWarningToast(BuildContext context,{required Text title, required Text description,Position toastPosition = Position.bottom }) {
  CherryToast.warning(
    displayCloseButton: false,
    title: title,
    displayTitle: true,
    description: description,
    animationType: AnimationType.fromLeft,
    animationDuration: const Duration(seconds: 2),
    animationCurve: Curves.fastLinearToSlowEaseIn,
    actionHandler: () {},
    autoDismiss: true,
    toastPosition: toastPosition,
  ).show(context);
}