import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/bloc/todo_bloc.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/widgets/ripple_extension.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({Key? key, required this.model, required this.isActive})
      : super(key: key);
  final TodoModel model;

  final bool isActive;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  void completeTask() {
    if (widget.model.isDone) {
      BlocProvider.of<TodoBloc>(context).add(TodoDeleted(todo: widget.model));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.lg, vertical: Insets.xs - 1.5),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(Insets.md),
            decoration: BoxDecoration(
                color: widget.isActive
                    ? Theme.of(context).primaryColor.withOpacity(0.1)
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: Shadows.small),
            child: Row(
              children: <Widget>[
                // check box To change when complete task
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.51,
                    ),
                  ),
                  child: widget.model.isDone
                      ? Center(
                          child: Icon(Icons.check,
                              size: 14.0,
                              color: Theme.of(context).primaryColor),
                        )
                      : Container(),
                ).ripple(() {
                  setState(() {
                    completeTask();
                  });
                }),

                // text
                Flexible(
                  fit: FlexFit.tight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          widget.model.title,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      if (widget.model.project != null)
                        Expanded(
                          child: Text(
                            "#${widget.model.project}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.accents[0]),
                            softWrap: true,
                            textAlign: TextAlign.right,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
