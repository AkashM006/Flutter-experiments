import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget titleWidget;
  const CustomAppBar({
    super.key,
    required this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget,
      shadowColor: Colors.grey,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
