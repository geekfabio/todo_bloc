import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';

class Tags extends StatefulWidget {
  const Tags({
    Key? key,
  }) : super(key: key);

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  bool isTagExpanded = false;
  bool isFolderExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (panelIndex, __) {
        switch (panelIndex) {
          case 0:
            isFolderExpanded = false;
            isTagExpanded = !isTagExpanded;
            break;
          case 1:
            isTagExpanded = false;
            isFolderExpanded = !isFolderExpanded;
            break;
          default:
        }
        setState(() {});
      },
      elevation: 0,
      animationDuration: AppTransitionTimes.slow,
      children: [
        ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: isTagExpanded,
            headerBuilder: (_, __) => Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 25,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.tag,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: Insets.md),
                      Text("Tags", style: Theme.of(context).textTheme.button),
                    ],
                  ),
                ),
            body: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTag(context,
                      color: const Color(0xFF23CF91), title: "Design"),
                  buildTag(context,
                      color: const Color(0xFF3A6FF7), title: "Work"),
                  buildTag(context,
                      color: const Color(0xFFF3CF50), title: "Friends"),
                  buildTag(context,
                      color: const Color(0xFF8338E1), title: "Family"),
                ],
              ),
            )),
        //FOLDERS
        ExpansionPanel(
            canTapOnHeader: true,
            isExpanded: isFolderExpanded,
            headerBuilder: (_, __) => Container(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 25,
                    bottom: 10,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.folder,
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(width: Insets.md),
                      Text("Projects",
                          style: Theme.of(context).textTheme.button),
                    ],
                  ),
                ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildProject(context, color: Colors.red, title: "Design"),
                buildProject(context,
                    color: const Color(0xFF3A6FF7), title: "Work"),
                buildProject(context, color: Colors.amber, title: "Friends"),
                buildProject(context,
                    color: Colors.pinkAccent, title: "Family"),
              ],
            )),
      ],
    );
  }

  InkWell buildTag(BuildContext context,
      {required Color color, required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20 * 1.5, 10, 0, 10),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.tag,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 20 / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
    );
  }

  InkWell buildProject(BuildContext context,
      {required Color color, required String title}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20 * 1.5, 10, 0, 10),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.dot_square,
              color: color,
              size: 20,
            ),
            const SizedBox(width: 20 / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.button,
            ),
          ],
        ),
      ),
    );
  }
}
