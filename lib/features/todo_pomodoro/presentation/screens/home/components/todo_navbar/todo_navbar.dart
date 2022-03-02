import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/home/components/todo_navbar/steps_card.dart';
import 'package:todo_bloc/features/todo_pomodoro/presentation/screens/models/todox_model.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/themes/theme.dart';
import 'package:todo_bloc/features/todo_pomodoro/shared/widgets/ripple_extension.dart';

class TodoNavBar extends StatefulWidget {
  const TodoNavBar({Key? key}) : super(key: key);

  @override
  State<TodoNavBar> createState() => _TodoNavBarState();
}

class _TodoNavBarState extends State<TodoNavBar> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        initialDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
            height: AppTheme.screenHeight(context),
            padding: const EdgeInsets.symmetric(
                horizontal: Insets.lg, vertical: Insets.xs),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                const EditTodoInput(),
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
                //TODO componetizar aqui
                const BorderContainer(),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextField(
                          maxLength: 50,
                          minLines: 1,
                          maxLines: 1,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            hintText: "Add a step",
                            counterText: "",
                            filled: true,
                            suffixIcon: const Icon(
                              CupertinoIcons.add,
                              size: 20,
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //TODO here steps List
                //TODO chance this condition
                if (todos.length == 100)
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: todos.length,
                      itemBuilder: (context, index) => StepsCard(
                        model: todos[index],
                      ),
                    ),
                  ),
                const BorderContainer(),
                const SizedBox(
                  height: 10.0,
                ),

                //DATE PICKER
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.md),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.calendar,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: Insets.sm,
                      ),
                      const Text('Due date'),
                      const Spacer(),
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                    ],
                  ).ripple(() => _selectDate(context)),
                ),
                //Project
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.folder,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: Insets.sm,
                    ),
                    const Text('Project'),
                    const Spacer(),
                    const Text("Tasks"),
                  ],
                ).ripple(() => _selectDate(context)),
                //Reminder
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Insets.md),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.alarm,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        width: Insets.sm,
                      ),
                      const Text('Reminder'),
                      const Spacer(),
                      const Text("None"),
                    ],
                  ).ripple(() => _selectDate(context)),
                ),
                //TAG
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      CupertinoIcons.repeat,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      width: Insets.sm,
                    ),
                    const Text('Repeat'),
                    const Spacer(),
                    const Text("None"),
                  ],
                ).ripple(() => _selectDate(context)),
                const BorderContainer(),
                Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: TextField(
                          maxLength: 300,
                          minLines: 3,
                          maxLines: 10,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            hintText: "Add a note...",
                            counterText: "",
                            filled: true,
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
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

class BorderContainer extends StatelessWidget {
  const BorderContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).backgroundColor),
        ),
      ),
    );
  }
}

class EditTodoInput extends StatelessWidget {
  const EditTodoInput({Key? key}) : super(key: key);

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
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
