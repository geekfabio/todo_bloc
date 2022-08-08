import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/utils/responsive.dart';

import 'menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? Insets.lg : 0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: Insets.lg),
          child: Column(
            children: [
              Row(
                children: [
                  // Image.asset(
                  //   "assets/images/Logo Outlook.png",
                  //   width: 46,
                  // ),
                  const Spacer(),
                  // Hide closeButton on Desktop
                  if (!Responsive.isDesktop(context)) const CloseButton(),
                ],
              ),
              const SizedBox(height: Insets.lg),
              //TODO here
              const SizedBox(height: Insets.lg),
              //TODO here
              const SizedBox(height: Insets.lg * 2),

              // Menu Items
              MenuItemCustom(
                callback: () {},
                title: "Today",
                icon: Icons.wb_sunny_outlined,
                isActive: false,
                itemCount: 3,
                showBorder: false,
                iconColor: Theme.of(context).primaryColor,
              ),
              MenuItemCustom(
                callback: () {},
                title: "Tomorrow",
                icon: Icons.wb_twilight_rounded,
                isActive: false,
                showBorder: false,
                iconColor: Theme.of(context).primaryColor,
              ),
              MenuItemCustom(
                callback: () {},
                title: "Upcomming",
                icon: CupertinoIcons.speedometer,
                isActive: false,
                showBorder: false,
                iconColor: Theme.of(context).primaryColor,
              ),
              MenuItemCustom(
                callback: () {},
                title: "Someday",
                icon: Icons.calendar_view_month_sharp,
                isActive: false,
                showBorder: false,
                iconColor: Theme.of(context).primaryColor,
              ),
              MenuItemCustom(
                callback: () {},
                title: "Completed",
                icon: CupertinoIcons.calendar_today,
                isActive: false,
                itemCount: 9,
                showBorder: true,
                iconColor: Theme.of(context).primaryColor,
              ),

              // const Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
