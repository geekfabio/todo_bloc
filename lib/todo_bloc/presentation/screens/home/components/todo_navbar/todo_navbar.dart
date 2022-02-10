import 'package:flutter/cupertino.dart';
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
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.lg, vertical: Insets.xs),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                TodoContent(),
                //TODO componetizar aqui
                SizedBox(
                    height: 20,
                    child: Row(
                      children: const [
                        //TODO implementar
                        Expanded(
                            child: Placeholder(
                          color: Colors.green,
                        )),
                        Expanded(
                            child: Placeholder(
                          color: Colors.blue,
                        ))
                      ],
                    )),

                Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom:
                          BorderSide(color: Theme.of(context).backgroundColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: Insets.lg * 0.75),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
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
    return Stack(
      children: [
        Row(
          children: <Widget>[
            // check box To change when complete task
            Align(
              alignment: AlignmentDirectional.center,
              heightFactor: 0,
              child: AnimatedContainer(
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
            ),

            // text
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: TextField(
                      maxLength: 100,
                      minLines: 1,
                      maxLines: 3,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        hintText: "Edit a task",
                        counterText: "",
                        filled: true,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  //  if (widget.model.tag != null)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
