import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_applicaiton/features/ui/todo/app/application.dart';
import 'package:todo_applicaiton/features/ui/todo/view/todo_edit.dart';

import '../../../common/widget/common_widget.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Application"),
      ),
      body: SafeArea(
          child: ref.watch(todoProvide).when(
              data: (data) {
                if (data.isNotEmpty) {
                  return ListView.separated(
                      separatorBuilder: (c, i) => Divider(),
                      itemCount: data.length,
                      shrinkWrap: true,
                      itemBuilder: (c, index) => Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  leading: Text(data[index].id.toString()),
                                  title: Text(data[index].title),
                                  subtitle: Text(data[index].description),
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    await showSheet(
                                        context, TodoEdit(data[index], index));
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    ref
                                        .read(todoProvide.notifier)
                                        .deleteTodo(index);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ));
                } else {
                  return noRecord;
                }
              },
              error: (e, st) => noRecord,
              loading: () => const CircularProgressIndicator())),
    );
  }
}
