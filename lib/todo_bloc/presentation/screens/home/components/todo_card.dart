import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/models/todo_model.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/ripple_extension.dart';

class TodoCard2 extends StatefulWidget {
  const TodoCard2({Key? key, required this.model, required this.isActive})
      : super(key: key);
  final TodoModel model;

  final bool isActive;

  @override
  State<TodoCard2> createState() => _TodoCard2State();
}

class _TodoCard2State extends State<TodoCard2> {
  void completeTask() {
    widget.model.isChecked = !widget.model.isChecked;
    if (widget.model.isChecked) {
      todos.remove(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.xs),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: AppTransitionTimes.medium,
            padding: const EdgeInsets.all(Insets.md),
            decoration: BoxDecoration(
                color: widget.isActive
                    ? Theme.of(context).selectedRowColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: Shadows.small),
            child: Row(
              children: <Widget>[
                // check box To change when complete task
                AnimatedContainer(
                  duration: AppTransitionTimes.medium,
                  curve: Curves.bounceInOut,
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
                  child: widget.model.isChecked
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
                      if (widget.model.tag != null)
                        Expanded(
                          child: Text(
                            "#${widget.model.tag!.title}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: widget.model.tag!.color),
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
