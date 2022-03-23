import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/components/menu/menu.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/home/components/build_todo_list/build_todo_list_widget.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/utils/responsive.dart';

import '../../../../../../service_locator.dart';
import 'todo_navbar/todo_navbar.dart';

class ListOfTodos extends StatefulWidget {
  const ListOfTodos({Key? key}) : super(key: key);

  @override
  _ListOfTodosState createState() => _ListOfTodosState();
}

class _ListOfTodosState extends State<ListOfTodos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _txtController = TextEditingController();

  final todoBloc = sl<TodoBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
          todoBloc.add(TodoFetchList());
          setState(() {});
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

                      // ! Input to add Todo
                      Padding(
                        padding: const EdgeInsets.all(Insets.lg),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _txtController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Add Todo [press enter]",
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(Insets.lg),
                                ),
                                onEditingComplete: () {
                                  _addTodoOnBloc();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      BlocBuilder<TodoBloc, TodoState>(
                        bloc: todoBloc,
                        builder: (context, state) {
                          if (state is TodoLoadingState) {
                            return const Text("No Todos");
                          } else if (state is TodoEmptyList) {
                            return const Text("No Todos");
                          } else if (state is TodoLoadedState) {
                            return BuildTodoList(todoBloc: todoBloc);
                          } else {
                            return const Text("No Todos");
                          }
                        },
                      ),

                      // ! List view
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

  void _addTodoOnBloc() {
    TodoModel todoModel = TodoModel(
        id: "id",
        title: _txtController.text,
        dateCreated: "dateCreated",
        dateFinish: "dateFinish",
        dateToStart: "today",
        project: "Tasks",
        isDone: false);
    if (_txtController.text != "") {
      todoBloc.add(TodoAdded(todo: todoModel));
      setState((() => _txtController.text = ""));
    }
  }
}
