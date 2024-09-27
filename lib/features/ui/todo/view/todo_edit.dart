import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_applicaiton/features/common/model/todo_entity.dart';
import 'package:todo_applicaiton/features/ui/todo/app/application.dart';

class TodoEdit extends ConsumerStatefulWidget {
  const TodoEdit(this.data, this.index, {super.key});
  final TodoEntity data;
  final int index;
  @override
  ConsumerState<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends ConsumerState<TodoEdit> {
  late TextEditingController title;
  late TextEditingController description;
  @override
  void initState() {
    super.initState();
    title = TextEditingController(text: widget.data.title);
    description = TextEditingController(text: widget.data.description);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        child: Column(
          children: [
            commonForm("Title", title),
            commonForm("Description", description),
            InkWell(
              onTap: () {
                ref
                    .read(todoProvide.notifier)
                    .updateTodo(widget.index, title.text, description.text);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Text("Edit",
                    style: GoogleFonts.cabin(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            )
          ],
        ));
  }

  ListTile commonForm(
    String title,
    TextEditingController controller,
  ) {
    return ListTile(
      title: Text(title),
      subtitle: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: title,
            label: Text(title),
            border: const OutlineInputBorder(),
          )),
    );
  }
}
