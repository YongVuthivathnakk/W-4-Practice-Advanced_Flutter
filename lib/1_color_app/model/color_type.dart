import 'package:flutter/material.dart';

// Add new button here with colors

enum ColorType {
  purple(Colors.purple),
  red(Colors.red),
  pink(Colors.pink),

  black(Colors.black),
  yellow(Colors.yellow);

  final Color color;

  const ColorType(this.color);
}
