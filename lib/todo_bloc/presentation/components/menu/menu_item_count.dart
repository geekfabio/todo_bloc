import 'package:flutter/material.dart';

class MenuItemCount extends StatelessWidget {
  const MenuItemCount({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(9)),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
      ),
    );
  }
}
