import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:todo_bloc/todo_bloc/shared/utils/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: kIsWeb ? Insets.lg : 0),
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: Insets.lg),
          child: Column(
            children: [
              Row(
                children: [
                  // Image.asset(
                  //   "assets/images/Logo Outlook.png",
                  //   width: 46,
                  // ),
                  const Spacer(),
                  // We don't want to show this close button on Desktop mood
                  if (!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: Insets.lg),
              //TODO here
              SizedBox(height: Insets.lg),
              //TODO here
              SizedBox(height: Insets.lg * 2),
              // Menu Items
              SideMenuItem(
                press: () {},
                title: "Inbox",
                iconSrc: "assets/Icons/Inbox.svg",
                isActive: true,
                itemCount: 3,
              ),
              SideMenuItem(
                press: () {},
                title: "Sent",
                iconSrc: "assets/Icons/Send.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Drafts",
                iconSrc: "assets/Icons/File.svg",
                isActive: false,
              ),
              SideMenuItem(
                press: () {},
                title: "Deleted",
                iconSrc: "assets/Icons/Trash.svg",
                isActive: false,
                showBorder: false,
              ),

              const SizedBox(height: Insets.lg * 2),
              // Tags
              //   Tags(),
            ],
          ),
        ),
      ),
    );
  }
}
