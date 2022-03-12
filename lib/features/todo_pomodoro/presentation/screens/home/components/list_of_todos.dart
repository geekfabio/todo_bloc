import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/components/menu/menu.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/home/components/todo_card/todo_card.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/utils/responsive.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/widgets/ripple_extension.dart';

import '../../../../../../injection_container.dart';
import 'todo_navbar/todo_navbar.dart';

class ListOfTodos extends StatefulWidget {
  const ListOfTodos({Key? key}) : super(key: key);

  @override
  _ListOfTodosState createState() => _ListOfTodosState();
}

class _ListOfTodosState extends State<ListOfTodos> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController txtController = TextEditingController();
  late ScrollController _scrollController;
  TodoModel tTdodoItem = const TodoModel(
    id: '1',
    title: 'title',
    dateCreated: 'description',
    isDone: false,
  );
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

                      // ! Input to add Todo
                      InputTodo(txtController: txtController),
                      const ListViewTodo(),
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

class InputTodo extends StatelessWidget {
  const InputTodo({
    Key? key,
    required this.txtController,
  }) : super(key: key);

  final TextEditingController txtController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.lg),
        child: BlocProvider(
          create: (context) => sl<TodoBloc>(),
          child: TextField(
            controller: txtController,
            onSubmitted: (value) {
              txtController.text = value;
            },
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
    );
  }
}

class ListViewTodo extends StatelessWidget {
  const ListViewTodo({
    Key? key,
  }) : super(key: key);

  BlocProvider<TodoBloc> buildBody(BuildContext context) {
    TodoModel todoModel = const TodoModel(
        id: "id", title: "text", dateCreated: "dateCreated", isDone: false);
    return BlocProvider(
        create: ((context) => sl<TodoBloc>()),
        child: BlocListener<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is TodoLoaded) {
              const TodoList();
            }
            if (state is TodoAdded) {
              const TodoList();
            }
            if (state is TodoUpdated) {
              const TodoList();
            }
          },
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoInitial) {
                const CircularProgressIndicator();
              }
              if (state is TodoLoaded) {
                const TodoList();
              }

              if (state is TodoAdded) {
                const TodoList();
              }

              return Center(
                child: Column(
                  children: [
                    Text(
                      BlocProvider.of<TodoBloc>(context)
                          .listTodoModel
                          .length
                          .toString(),
                      style: const TextStyle(fontSize: 40),
                    ).ripple(() {
                      BlocProvider.of<TodoBloc>(context)
                          .add(TodoAdded(todo: todoModel));
                      debugPrint("Todo Added");
                      debugPrint(BlocProvider.of<TodoBloc>(context)
                          .listTodo
                          .length
                          .toString());
                    }),
                    TextButton(
                        child: const Icon(Icons.adb),
                        onPressed: () => BlocProvider.of<TodoBloc>(context)
                            .add(TodoAdded(todo: todoModel))),
                    TextButton(
                        child: const Icon(Icons.ac_unit),
                        onPressed: () => BlocProvider.of<TodoBloc>(context)
                            .add(TodoUpdated(todo: todoModel)))
                  ],
                ),
              );
            },
          ),
        ));
  }

  @override
  build(BuildContext context) {
    return buildBody(context);
  }
}

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: BlocProvider.of<TodoBloc>(context).listTodoModel.length,
        itemBuilder: (context, index) => TodoCard(
              isActive: Responsive.isMobile(context) ? false : index == 0,
              model: BlocProvider.of<TodoBloc>(context).listTodoModel[index],
            ));
  }
}
