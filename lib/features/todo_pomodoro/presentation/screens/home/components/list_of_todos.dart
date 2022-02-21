import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/components/menu/menu.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/models/todox_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/utils/responsive.dart';

import 'todo_card/todo_card.dart';
import 'todo_navbar/todo_navbar.dart';

class ListOfTodos extends StatefulWidget {
  const ListOfTodos({Key? key}) : super(key: key);

  @override
  _ListOfTodosState createState() => _ListOfTodosState();
}

class _ListOfTodosState extends State<ListOfTodos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(borderRadius: AppBorders.smBorder),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          //Navigator.push(context, AddTodoPage());
        },
      ),
      key: _scaffoldKey,
      drawer: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: const Menu()),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(top: kIsWeb ? Insets.lg : 0),
                color: Theme.of(context).backgroundColor,
                child: SafeArea(
                  right: false,
                  child: Column(
                    children: [
                      if (!Responsive.isDesktop(context))
                        Container(
                          color: Theme.of(context).splashColor,
                          child: Row(
                            children: [
                              IconButton(
                                padding: const EdgeInsets.only(
                                    left: Insets.lg, right: Insets.xs),
                                icon: const Icon(Icons.menu),
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                              ),
                              //TODO change this text to Day of Week and add a Icon to View Callendar
                              Text(
                                "Menu",
                                style: AppTheme.h4Style,
                              )
                            ],
                          ),
                        ),
                      const SizedBox(
                        height: Insets.lg,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(Insets.lg),
                        child: Row(
                          children: [
                            Text(
                              "Today Tasks",
                              style:
                                  Theme.of(context).primaryTextTheme.subtitle1,
                              textAlign: TextAlign.start,
                            ),
                            const Spacer(),
                            MaterialButton(
                              minWidth: 20,
                              onPressed: () {},
                              child: const Icon(
                                CupertinoIcons.sort_up,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: Insets.lg,
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: Insets.lg),
                          child: TextField(
                            onChanged: (value) {},
                            maxLength: 100,
                            decoration: const InputDecoration(
                              hintText: "Add a task, press [enter]",
                              filled: true,
                              counterText: "",
                              suffixIcon: Padding(
                                  padding: EdgeInsets.all(20 * 0.75), //15
                                  child: Icon(CupertinoIcons.add)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (context, index) => TodoCard(
                            isActive: Responsive.isMobile(context)
                                ? false
                                : index == 0,
                            model: todos[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          if (AppTheme.screenWidth(context) > 1345)
            const Expanded(flex: 2, child: TodoNavBar())
        ],
      ),
    );
  }
}
