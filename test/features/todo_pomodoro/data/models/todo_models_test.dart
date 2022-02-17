import 'package:flutter_test/flutter_test.dart';
import 'package:todo_bloc/features/todo_pomodoro/data/models/todo_models.dart';
import 'package:todo_bloc/features/todo_pomodoro/domain/entities/todo_item.dart';

void main() {
  const model = TodoModel;
  test("Test if TodoModel is a subtype of a TodoItem entitie", () {
    expect(TodoModel, isA<TodoItem>());
  });
}
