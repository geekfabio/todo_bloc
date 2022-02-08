import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/components/menu/menu_item_count.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';

class MenuItem extends StatelessWidget {
  final bool isActive;
  final bool isHover;
  final bool showBorder;
  final int itemCount;
  final IconData icon;
  final Color iconColor;
  final String title;
  final VoidCallback callback;
  const MenuItem({
    Key? key,
    required this.title,
    required this.callback,
    required this.icon,
    required this.iconColor,
    this.isActive = false,
    this.itemCount = 0,
    this.isHover = false,
    this.showBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.xs),
      child: InkWell(
        onTap: callback,
        child: Row(
          children: [
            (isActive || isHover)
                ? const Icon(
                    Icons.arrow_downward,
                    size: 15,
                  )
                : const SizedBox(width: 15),
            const SizedBox(width: Insets.sm),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Theme.of(context).backgroundColor),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                      size: 20,
                    ),
                    const SizedBox(width: Insets.lg * 0.75),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: (isActive || isHover)
                                ? Theme.of(context).backgroundColor
                                : Colors.grey,
                          ),
                    ),
                    const Spacer(),
                    if (itemCount != 0) MenuItemCount(count: itemCount),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
