import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/model/todo_entity.dart';
import 'todo_notifier.dart';

final todoProvide =
    StateNotifierProvider<TodoNotifier, AsyncValue<List<TodoEntity>>>(
        (ref) => TodoNotifier());
