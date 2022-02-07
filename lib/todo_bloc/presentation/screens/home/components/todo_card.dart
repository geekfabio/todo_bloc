import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/models/home/todo.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/models/todo_model.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/ripple_extension.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    Key? key,
    this.isActive = true,
    required this.email,
    required this.press,
  }) : super(key: key);

  final bool isActive;
  final Email email;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.lg, vertical: Insets.sm),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(Insets.lg),
              decoration: BoxDecoration(
                color: isActive
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          //   backgroundImage: AssetImage(email.image),
                        ),
                      ),
                      SizedBox(width: 20 / 2),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "${email.name} \n",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: isActive ? Colors.white : Colors.redAccent,
                            ),
                            children: [
                              TextSpan(
                                text: email.subject,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: isActive
                                          ? Colors.white
                                          : Colors.redAccent,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email.time,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: isActive ? Colors.white70 : null,
                                    ),
                          ),
                          const SizedBox(height: 5),
                          if (email.isAttachmentAvailable)
                            Icon(
                              Icons.email_sharp,
                              color: isActive ? Colors.white70 : Colors.grey,
                            )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20 / 2),
                  Text(
                    email.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.caption!.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : null,
                        ),
                  )
                ],
              ),
            ),
            if (!email.isChecked)
              Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                  )),
            if (email.tagColor != null)
              Positioned(
                left: 8,
                top: 5,
                child: Icon(
                  Icons.ac_unit_outlined,
                  color: email.tagColor,
                ),
              )
          ],
        ),
      ),
    );
  }
}

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
            width: !widget.model.isChecked ? 1000 : 300,
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
