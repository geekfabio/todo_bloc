import '../../domain/entities/todo_item.dart';

class TodoModel extends TodoItem {
  const TodoModel()
      : super(
          id: '1',
          title: 'title',
          dateCreated: 'description',
          isDone: false,
        );
}
