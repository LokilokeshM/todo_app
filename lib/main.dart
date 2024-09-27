import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_applicaiton/common/global.dart';

import 'features/ui/todo/view/todo_list.dart';

void main() async {
  // Ensure that the Flutter engine is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize the shared preferences
  final prefs = await SharedPreferences.getInstance();
  await Global.init(prefs);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoList(),
    );
  }
}
