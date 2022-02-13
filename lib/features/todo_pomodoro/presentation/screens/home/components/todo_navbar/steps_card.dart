import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/models/todo_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/widgets/ripple_extension.dart';

class StepsCard extends StatefulWidget {
  const StepsCard({Key? key, required this.model}) : super(key: key);
  final TodoModel model;

  @override
  State<StepsCard> createState() => _StepsCardState();
}

class _StepsCardState extends State<StepsCard> {
  void completeTask() {
    widget.model.isChecked = !widget.model.isChecked;
    if (widget.model.isChecked) {
      todos.remove(widget.model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Insets.xs),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(Insets.xs),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Row(
              children: <Widget>[
                // check box To change when complete task
                Container(
                  margin: const EdgeInsets.only(left: 0),
                  height: 20.0,
                  width: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                    // completeTask();
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
