import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/ripple_extension.dart';

class TodoNavBar extends StatelessWidget {
  const TodoNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [TodoContent()],
            ),
          ),
        ),
      ),
    );
  }
}

class TodoContent extends StatelessWidget {
  const TodoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Insets.lg, vertical: Insets.xs),
      child: Stack(
        children: [
          Row(
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
                  child: //widget.model.isChecked ?
                      Center(
                    child: Icon(Icons.check,
                        size: 14.0, color: Theme.of(context).primaryColor),
                  )
                  // : Container(),
                  ).ripple(() {}),

              // text
              Flexible(
                fit: FlexFit.tight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "widget.model.title",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    //  if (widget.model.tag != null)
                    Expanded(
                      child: Text(
                        "",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.red),
                        softWrap: true,
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
