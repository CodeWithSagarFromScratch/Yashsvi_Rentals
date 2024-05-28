import 'package:flutter/material.dart';
import 'package:yashvi_rentals/Constant/color_constant.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  final Widget? leading;
  final bool? centerTitle;
  final Color? backGroundColor;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.centerTitle,
      this.leading,
      this.action,
      this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backGroundColor ?? ColorConstant.redAccent,
      title: Text(
        title,
        style: const TextStyle(color: ColorConstant.white),
      ),
      leading: leading,
      actions: action,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
