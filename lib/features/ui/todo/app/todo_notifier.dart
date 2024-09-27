import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_applicaiton/common/global.dart';
import 'package:todo_applicaiton/features/common/model/todo_entity.dart';

class TodoNotifier extends StateNotifier<AsyncValue<List<TodoEntity>>> {
  TodoNotifier() : super(const AsyncLoading()) {
    loadTodo();
  }
  List<TodoEntity> todos = [];
  void loadTodo() {
    try {
      state = AsyncValue.loading();
      List.generate(100, (index) {
        todos.add(TodoEntity(
            id: index,
            description: "Description $index",
            title: "Title $index"));
      });

      state = AsyncValue.data([...todos]);
      Global.getInstance().todo = [...todos.map((e) => e.toString())];
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void deleteTodo(int index) {
    try {
      todos.removeAt(index);
      state = AsyncValue.data([...todos]);
      // instance.todo = [...todos.map((e) => e.toString())];
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void updateTodo(int index, String title, String description) {
    try {
      todos[index].title = title;
      todos[index].description = description;
      state = AsyncValue.data([...todos]);
      // instance.todo = [...todos.map((e) => e.toString())];
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
