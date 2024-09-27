import 'package:flutter/material.dart';

Widget noRecord = const Center(
  child: Text("No Record Found"),
);

Future showSheet(BuildContext context, Widget child) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return child;
    },
  );
}
