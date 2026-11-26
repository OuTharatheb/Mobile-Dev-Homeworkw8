import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Label("Method 1: Loop in Array", bold: true),
              for (var color in colors) Label(color),        
              // TODO
              Label("Method 2: Map", bold: true),
              // TODO
              ...colors.map((color) => Label(color)).toList(),
              Label("Method 3: Dedicated Function", bold: true),
              // TODO
              ...getLabels(colors),
            ],
          ),
        ),
      ),
    ),
  );
}
List<Label> getLabels(List<String> colors) {
  List<Label> labels = [];
  for (var color in colors) {
    labels.add(Label(color));
  }
  return labels;
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: (bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }
}
