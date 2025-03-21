import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomIconModel {
  final IconData unselected, selected;

  BottomIconModel({
    required this.selected,
    required this.unselected,
  });
}

List<BottomIconModel> bottomIcons = [
  BottomIconModel(
    selected: Icons.home_filled,
    unselected: Icons.home_outlined,
  ),
  BottomIconModel(
    selected: CupertinoIcons.chat_bubble_text_fill,
    unselected: CupertinoIcons.chat_bubble_text,
  ),
  BottomIconModel(
    selected: CupertinoIcons.compass_fill,
    unselected: CupertinoIcons.compass,
  ),
  BottomIconModel(
    selected: Icons.person_rounded,
    unselected: Icons.person_outline_rounded,
  ),
];
