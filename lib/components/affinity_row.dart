import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget affinityRow(String title, List<String> values, Color color) {
  if (values.isEmpty) return const SizedBox();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold)),
      const SizedBox(height: 6),
      Wrap(
        spacing: 6,
        children: values
            .map((e) => Chip(
          label: Text(e),
          backgroundColor: color.withOpacity(0.2),
          labelStyle: TextStyle(color: color),
        ))
            .toList(),
      ),
      const SizedBox(height: 12),
    ],
  );
}