import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/home/components/todo_navbar/steps_card.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/models/todo_model.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';
import 'package:todo_bloc/todo_bloc/shared/utils/responsive.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/ripple_extension.dart';

import '../todo_card.dart';

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
      firstDate: selectedDate,
      initialDate: DateTime(selectedDate.year, 8),
      lastDate: DateTime(selectedDate.year + 5, 8),
    );
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
                const TodoContent(),
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
                if (todos.length > 0)
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                      itemCount: todos.length,
                      itemBuilder: (context, index) => StepsCard(
                        model: todos[index],
                      ),
                    ),
                  ),
                const BorderContainer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${selectedDate.toLocal()}".split(' ')[0]),
                    SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select date'),
                    ),
                  ],
                ),
                const BorderContainer(),
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
